import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  // Button Provider For FilterButton
  Offset vegOffset = const Offset(0, 0);
  bool veg = false;

  Offset nonVegOffset = const Offset(0, 0);
  bool nonVeg = false;

  Future vegOnFilter() async {
    await Future.delayed(const Duration(milliseconds: 200));
    vegOffset = const Offset(1.5, 0);
    veg = true;

    if (nonVeg) {
      nonVegOffset = const Offset(0, 0);
      nonVeg = false;
    }
    notifyListeners();
  }

  Future vegOffFilter() async {
    await Future.delayed(const Duration(milliseconds: 200));
    vegOffset = const Offset(0, 0);
    veg = false;
    notifyListeners();
  }

  Future nonVegOnFilter() async {
    await Future.delayed(const Duration(milliseconds: 200));
    nonVegOffset = const Offset(1.5, 0);
    nonVeg = true;

    if (veg) {
      vegOffset = const Offset(0, 0);
      veg = false;
    }
    notifyListeners();
  }

  Future nonVegOffFilter() async {
    await Future.delayed(const Duration(milliseconds: 200));
    nonVegOffset = const Offset(0, 0);
    nonVeg = false;
    notifyListeners();
  }
}
