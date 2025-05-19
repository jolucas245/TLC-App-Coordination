import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/root_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const RootApp());
}
