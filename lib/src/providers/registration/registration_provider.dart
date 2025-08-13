// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

@injectable
class RegistrationProvider with ChangeNotifier {
  String _selectedIndex = 'M';

  String get selectedIndex => _selectedIndex;

  void selectRadio(String value) {
    if (_selectedIndex != value) {
      _selectedIndex = value;
      notifyListeners();
    }
  }
}
