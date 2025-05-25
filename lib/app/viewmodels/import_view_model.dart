import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:tlc/app/models/cursista_model.dart';

class ImportViewModel extends ChangeNotifier{
  bool _isFilePicked = false;
  String? _fileName;
  String? _lastFileHash;
  String? _errorMessage;
  List<CursistaModel> _cursistas = [];
  List<List<String>> _tableData = [];
  bool _isLoading = false;
  File? _selectedFile;
  
  bool get isFilePicked => _isFilePicked;
  String? get fileName => _fileName;
  String? get errorMessage => _errorMessage;
  List<CursistaModel> get cursistas => _cursistas;
  List<List<String>> get tableData => _tableData;
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
    _isLoading = true;
    notifyListeners();

    try{
      final content = await file.readAsString();

      final hash = md5.convert(utf8.encode(content)).toString();
      if(_lastFileHash == hash && _cursistas.isNotEmpty) return CsvImportStatus.alreadyProcessed;

      _lastFileHash = hash;

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
      _tableData = mapped.map((e) => e.toMap().values.map((v) => v.toString()).toList()).toList();
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
  error,
  alreadyProcessed
}