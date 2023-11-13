import 'package:flutter/material.dart';

class ListViewController with ChangeNotifier {
  bool _scrollState = true;
  bool get scrollState => _scrollState;

  void changeState(bool state) {
    if (state == scrollState) return;
    _scrollState = state;
    notifyListeners();
  }
}
