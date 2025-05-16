import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:tlc/app/models/cursista_model.dart';

class ImportViewModel extends ChangeNotifier{
  bool _isFilePicked = false;
  String? _fileName;
  String? _lastProcessedFilePath;
  String? _errorMessage;
  List<CursistaModel> _cursistas = [];
  bool _isLoading = false;
  File? _selectedFile;
  
  bool get isFilePicked => _isFilePicked;
  String? get fileName => _fileName;
  String? get errorMessage => _errorMessage;
  List<CursistaModel> get cursistas => _cursistas;
  bool get isLoading => _isLoading;
  File? get selectedFile => _selectedFile;
  
  Future<CsvImportStatus> uploadCsvFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ["csv"]
    );

    if(result != null && result.files.single.path != null){
      final File file = File(result.files.single.path!);
      _isFilePicked = true;
      _fileName = result.files.first.name;
      _errorMessage = null;
      _selectedFile = file;

      final resultStatus = await convertCsv(file);
      // notifyListeners();
      return resultStatus;
    } else {
      return CsvImportStatus.cancelled;
    }
  }

  void clearError(){
    _errorMessage = null;
    notifyListeners();
  }

  Future<CsvImportStatus> convertCsv(File file) async {
    if(_lastProcessedFilePath == file.path && _cursistas.isNotEmpty) return CsvImportStatus.success;
    _isLoading = true;
    notifyListeners();

    try{
      final content = await file.readAsString();

      final rows = const CsvToListConverter(
        fieldDelimiter: ';',
        eol: '\n',
        shouldParseNumbers: false,
      ).convert(content);

      final rawHeaders = rows.first.cast<String>();
      final cleanHeaders = rawHeaders
        .map((e) => e.replaceAll('\n', ' ').replaceAll('"', '').trim())
        .toList();
      final data = rows.skip(1);
      final mapped = data.map((row){
        final map = <String, dynamic>{};
        for (int i = 0; i < cleanHeaders.length; i++){
          map[cleanHeaders[i]] = row[i];
        }
        return CursistaModel.fromMap(map);
      }).toList();

      _cursistas = mapped;
      _lastProcessedFilePath = file.path;
      return CsvImportStatus.success;
    } catch (e){
      _errorMessage = e.toString();
      return CsvImportStatus.error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }

  }

}

enum CsvImportStatus{
  success,
  cancelled,
  error
}