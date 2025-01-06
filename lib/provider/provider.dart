import 'package:flutter/material.dart';
import 'package:pashusevak/models/appointmentList.dart';
import 'package:pashusevak/services/apiServices.dart';

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

class AppointmentsProvider with ChangeNotifier {
  final NetworkApiServices _apiServices = NetworkApiServices();

  List<AppointmentListModel> _appointments = [];
  bool _isFetching = false;

  List<AppointmentListModel> get appointments => _appointments;
  bool get isFetching => _isFetching;

  Future<void> fetchAppointments(String sid) async {
    if (_appointments.isNotEmpty) {
      return; 
    }

    _isFetching = true;
    notifyListeners();

    try {
      _appointments = await _apiServices.getAppointmentList(sid);
    } catch (e) {
      print(e);
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}