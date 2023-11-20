import 'package:flutter/material.dart';

class TextFieldModel {
  String? content;

  TextFieldModel({this.content});
}

class ContentOptionsController extends ChangeNotifier {
  final int _contentMin = 1;
  final int _contentMax = 5;

  final Map<int, TextFieldModel> _textField = {0: TextFieldModel(content: '')};

  Map<int, TextFieldModel> get textField => _textField;

  void contentAdd() {
    if (_textField.length >= _contentMax) {
      return;
    }

    MapEntry<int, TextFieldModel> lastEntry = _textField.entries.last;
    _textField[lastEntry.key + 1] =
        TextFieldModel(content: 'index${lastEntry.key + 1}');
    notifyListeners();
  }

  void contentRemove({required int index}) {
    if (_textField.length <= _contentMin) {
      return;
    }

    _textField.remove(index);
    notifyListeners();
  }
}
