import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {

  Locale _locale = Locale('en', 'US');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners();
    }
  }

}

class DateProvider with ChangeNotifier {
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  void updateDate(DateTime? newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }
}