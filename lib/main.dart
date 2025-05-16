import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/root_app.dart';

Future<List<Map<String, dynamic>>> carregarCsvComoMap(String caminhoCsv) async {
  final rawCsv = await rootBundle.loadString(caminhoCsv); // se estiver em assets
  final csvList = const CsvToListConverter(
    fieldDelimiter: ';',
    eol: '\n',
    shouldParseNumbers: false,
  ).convert(rawCsv);

  final headers = csvList.first.cast<String>();
  final dados = csvList.skip(1);

  final listaMapeada = dados.map((linha) {
    final map = <String, dynamic>{};
    for (int i = 0; i < headers.length; i++) {
      map[headers[i]] = linha[i];
    }
    return map;
  }).toList();

  return listaMapeada;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  // final lista = await carregarCsvComoMap('assets/document/infos.csv');
  // print(lista.first);
  runApp(const RootApp());
}
