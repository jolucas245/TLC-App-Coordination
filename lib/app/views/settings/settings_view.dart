import 'package:flutter/material.dart';
import 'package:tlc/app/global/custom_scaffold.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Configurações",
      body: Text("Configurações"),
    );
  }
}