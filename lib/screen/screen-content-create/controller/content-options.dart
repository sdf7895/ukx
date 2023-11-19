import 'package:flutter/material.dart';

class ContentOptionsController extends ChangeNotifier {
  final int _contentMin = 1;
  final int _contentMax = 5;
  int _contentCount = 1;

  int get contentCount => _contentCount;

  void contentAdd() {
    if (contentCount >= _contentMax) {
      return;
    }

    _contentCount++;
    notifyListeners();
  }

  void contentRemove() {
    if (contentCount < _contentMin) {
      return;
    }
    _contentCount--;
    notifyListeners();
  }
}
