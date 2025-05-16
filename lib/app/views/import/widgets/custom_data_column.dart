import 'package:flutter/material.dart';

DataColumn customDataColumnWidget({
  required String labelText,
}){
  return DataColumn(
    label: Text(labelText, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),)
  );
}