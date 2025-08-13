// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/services/api/dashboard/dashboard_repo.dart';
import 'package:Medikalam/src/core/injection/injection.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/models/appointment/appointment_model.dart';
import 'package:Medikalam/src/models/dashboard/dash_response.dart';
import 'package:Medikalam/src/views/screens/dashboard/today_appt/today_appointment.dart';

@injectable
class DashboardProvider extends ChangeNotifier {
  final DashboardRepo _repo = getIt<DashboardRepo>();

  //Variables
  int _navIndex = 0;
  String _selectedValue = 'Last 6 Months';
  final List<String> _options = [
    'Last 6 Months',
    'Last 12 Months',
    'Last 3 Months'
  ];
  DashboardData _dashboardData = DashboardData.empty();
  Status _status = Status.initial;

  //Getters
  int get navIndex => _navIndex;
  String get selectedValue => _selectedValue;
  List<String> get options => _options;
  DashboardData get dashboardData => _dashboardData;
  Status get status => _status;

  void updateStatus(Status status) {
    _status = status;
    notifyListeners();
  }

  void updateIndex(int index) {
    _navIndex = index;
    notifyListeners();
  }

  // Method to update the selected value
  void updateSelectedValue(String value) {
    _selectedValue = value;
    _filterAppointments();
    notifyListeners();
  }

  // Method to update pen connection status
  void updatePenConnected(bool value) {
    notifyListeners();
  }

  List<AppointmentResponse> allAppointments = dummyAppointments;
  List<AppointmentResponse> _filteredAppointments = [];

  List<AppointmentResponse> get filteredAppointments => _filteredAppointments;

    void updateAppointments(List<AppointmentResponse> appointments) {
    allAppointments = appointments;
    _filterAppointments();
  }

    void _filterAppointments() {
    final now = DateTime.now();
    int monthsBack = _getMonthsBack(selectedValue);

    _filteredAppointments = allAppointments.where((appt) {
      final difference = now.difference(appt.apptDate).inDays ~/ 30;
      return difference <= monthsBack;
    }).toList();
  }

  int _getMonthsBack(String value) {
    switch (value) {
      case 'Last 3 Months':
        return 3;
      case 'Last 6 Months':
        return 6;
      case 'Last 12 Months':
        return 12;
      default:
        return 12;
    }
  }
  //APIs
  Future<void> getDashboardData() async {
    if (_dashboardData == DashboardData.empty()) {
      try {
        updateStatus(Status.loading);
        final data = await _repo.dashboardData();
        data.when(
          success: (success) {
            final result = success.copyWith(greeting: Helpers.greetingTitle());
            _dashboardData = result;
            updateStatus(Status.success);
            notifyListeners();
          },
          failure: (failure) {
            updateStatus(Status.error);
            debugPrint(failure.toString());
          },
        );
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
    }
  }
}
