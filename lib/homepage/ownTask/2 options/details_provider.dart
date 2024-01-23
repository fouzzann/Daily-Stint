import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  List<bool?> _isCompletedValues = [];

  List<bool?> get isCompletedValues => _isCompletedValues;

  void setCompletedValue(int index, bool value) {
    _isCompletedValues[index] = value;
    notifyListeners();
  }
}
