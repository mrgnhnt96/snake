part of '../intro_screen.dart';

final class _Choice extends ChangeNotifier {
  _Choice() : _difficulty = Difficulty.easy, _focused = Difficulty.easy;

  Difficulty _difficulty;
  Difficulty get difficulty => _difficulty;

  Difficulty _focused;
  Difficulty get focused => _focused;

  void select() {
    _difficulty = _focused;
    notifyListeners();
  }

  void next() {
    if (_focused.index == Difficulty.values.length - 1) {
      _focused = Difficulty.values.first;
    } else {
      _focused = Difficulty.values[_focused.index + 1];
    }
    notifyListeners();
  }

  void previous() {
    if (_focused.index == 0) {
      _focused = Difficulty.values.last;
    } else {
      _focused = Difficulty.values[_focused.index - 1];
    }

    notifyListeners();
  }
}
