import 'package:flutter/material.dart';

DataCell customDataCellWidget(
  String modelField,
  double zoom,
  VoidCallback onTap
){

  return DataCell(
    Text(
      modelField, 
      style: TextStyle(
        fontSize: 14 * zoom
      ),), 
      onTap: onTap, 
      onLongPress: null,
      onDoubleTap: null,
      onTapDown: null,
      onTapCancel: null,
      placeholder: false,
      showEditIcon: false
  );
}