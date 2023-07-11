import 'package:flutter/material.dart';

class TechTodayWorkProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _showSearchBar = false;
  bool get showSearchBar => _showSearchBar;

  void searchBarOnClick(bool val) {
    _showSearchBar = !val;
    notifyListeners();
  }

  resetValue() {
    _showSearchBar = false;
    _isLoading = false;
  }

  void isLoadingScreen(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> refreshComplain() async {
    isLoadingScreen(true);
    Future.delayed(const Duration(seconds: 0), () {
      isLoadingScreen(false);
    });
  }
}
