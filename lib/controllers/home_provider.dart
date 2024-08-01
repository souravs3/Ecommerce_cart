import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _currentSlider = 0;
  int get currentSlider => _currentSlider;

  void changeSlider(int index) {
    _currentSlider = index;
    notifyListeners();
  }

  List<List<Product>> _selectedCategories = [
    all,
    shoes,
    beauty,
    womenFashion,
    jewelry,
    menFashion
  ];

  List<List<Product>> get selectedCategories => _selectedCategories;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeTab(int index) {
    if (index >= 0 && index < _selectedCategories.length) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
