



import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  int _currentImage = 0;
  int get currentImage => _currentImage;

  void onChanged(int index) {
    _currentImage = index;
    notifyListeners();
  }

  int _currentColor = 1;
  int get currentColor => _currentColor;

  void colorChanged(int index) {
    _currentColor = index;
    notifyListeners();
  }

  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}