import 'package:flutter/material.dart';

class PreviewDataViewModel extends ChangeNotifier{
  double _zoom = 1.0;
  int? _selectedIndex;

  double get zoom => _zoom;
  int? get seletectIndex => _selectedIndex;

  void setZoom(double value){
    _zoom = value;
    notifyListeners();
  }

  void selectRow(int index){
    _selectedIndex != index ? _selectedIndex = index : _selectedIndex = null;
    notifyListeners();
  }
}