import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{

  int _selectedIndex = 0;
  final List<String> _filters = ["Todos", "Visitados", "Pendentes"];

  int get selectedIndex => _selectedIndex;
  List<String> get filters => _filters;

  void selectFilter(int index){
    _selectedIndex = index;
    notifyListeners();
  }

}