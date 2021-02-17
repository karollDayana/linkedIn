import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  int _selectedItem = 0;
  bool _show = true;
  Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
  Color activeColor = Color.fromRGBO(25, 25, 25, 1);
  Color inactiveColor = Color.fromRGBO(136, 136, 136, 1);

  int get selectedItem => this._selectedItem;
  bool get show => this._show;

  set selectedItem(int index) {
    this._selectedItem = index;
    notifyListeners();
  }

  set show(bool decision) {
    this._show = decision;
    notifyListeners();
  }
}
