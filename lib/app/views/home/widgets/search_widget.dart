import 'package:flutter/material.dart';

Widget searchWidget(){
  return TextFormField(
    style: TextStyle(fontSize: 14),
    decoration: InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey,
        size: 25,
      ),
      prefixIconConstraints: BoxConstraints(
        minHeight: 25,
        minWidth: 40,
      ),
      hintText: "Buscar por nome",
    ),
  );
}