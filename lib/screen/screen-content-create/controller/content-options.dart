import 'package:flutter/material.dart';

class TextFieldModel {
  String? content;

  TextFieldModel({this.content});
}

class ContentOptionsController extends ChangeNotifier {
  final int _contentMin = 1;
  final int _contentMax = 5;

  int _mentionStartIndex = 0;
  bool _mentionStatus = false;
  final Map<int, TextFieldModel> _textField = {0: TextFieldModel(content: '')};

  Map<int, TextFieldModel> get textField => _textField;
  bool get mentionStatus => _mentionStatus;

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

  void handleMentionStatus({required bool status}) {
    _mentionStatus = status;
    notifyListeners();
  }

  void keyboardEvent(String text, int cursorIndex) {
    if (text.isEmpty) return;

    String str = text.substring(cursorIndex - 1, cursorIndex);
    if (_mentionStartIndex != 0 && str != ' ') {
      if (_mentionStatus) return;
      handleMentionStatus(status: _mentionStringCheck(text));
    } else if (_mentionStrCheck(str, cursorIndex)) {
      if (_mentionStatus) return;
      handleMentionStatus(status: true);
    } else {
      if (!_mentionStatus) return;
      handleMentionStatus(status: false);
    }
  }

  bool _mentionStrCheck(String str, int cursorIndex) {
    switch (str) {
      case '@':
        _mentionStartIndex = cursorIndex;
        return true;
      case ' ':
        _mentionStartIndex = 0;
        return false;
      default:
        return false;
    }
  }

  bool _mentionStringCheck(String text) {
    String result =
        text.substring(_mentionStartIndex - 1 < 0 ? 0 : _mentionStartIndex - 1);
    RegExp mentionRegExp = RegExp(r'@');
    Iterable<RegExpMatch> matches = mentionRegExp.allMatches(result);

    return matches == 1;
  }
}
