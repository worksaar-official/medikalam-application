// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:Medikalam/services/api/appointment/appointment_repo.dart';
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';
import 'package:Medikalam/src/models/appointment/appointment_model.dart';
import 'package:Medikalam/src/providers/centralized_provider.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/success_booking_sheet.dart';

@injectable
class AppointmentProvider extends CentralizedProvider<AppointmentResponse> {
  final AppointmentRepo _repo;
  AppointmentProvider(this._repo) : super(_repo) {
    getDaysInMonth(year, month);
    setFilters("appt_date", DateTime.now().apiDate);
  }

  //Variables
  final _form = FormGroup({
    'patient_id': FormControl<String>(validators: [Validators.required]),
    'appt_date': FormControl<DateTime>(
        value: DateTime.now(), validators: [Validators.required]),
    'appt_time': FormControl<String>(validators: [Validators.required]),
  });

  int _date = DateTime.now().day;
  int _month = DateTime.now().month;
  int _year = DateTime.now().year;
  List<Map<String, String>> _daysInMonth = [];
  bool _showYear = false;
  List<AppointmentResponse> _upcomingAppointment = [];
  Status _upcomingStatus = Status.initial;

  //Getters
  bool get showYear => _showYear;
  FormGroup get form => _form;
  int get date => _date;
  int get month => _month;
  int get year => _year;
  List<Map<String, String>> get daysInMonth => _daysInMonth;
  String get titleDate => DateTime(_year, _month, _date).date;
  List<AppointmentResponse> get upcomingAppointment => _upcomingAppointment;
  Status get upcomingStatus => _upcomingStatus;

  //Methods
  void updateStatus(Status status) {
    if (status == Status.loading) {
      _upcomingAppointment = [];
    }
    _upcomingStatus = status;
    notifyListeners();
  }

  void toggleShowYear() {
    _showYear = !_showYear;
    notifyListeners();
  }

  void setDate(String date) {
    _date = int.parse(date);
    notifyListeners();
    setFilters("appt_date", "$year-$month-$date", fetch: true);
  }

  void getDaysInMonth(int year, int month) async {
    DateTime firstDay = DateTime(year, month, 1);
    DateTime lastDay = DateTime(
        year, month + 1, 0); // 0 gives the last day of the previous month

    List<Map<String, String>> days = [];
    for (int i = firstDay.day; i <= lastDay.day; i++) {
      DateTime currentDay = DateTime(year, month, i);
      String date = DateFormat('d').format(currentDay); // Extract just the day
      String day = DateFormat('EEE')
          .format(currentDay); // Get abbreviated day name (e.g., "Sun")

      days.add({
        'date': date,
        'day': day,
      });
    }

    clearDaysInMonth();
    _daysInMonth = days;
    notifyListeners();
  }

  void clearDaysInMonth() {
    _daysInMonth = [];
    notifyListeners();
  }

  void setMonth(int month) {
    _month = month;
    notifyListeners();
    getDaysInMonth(_year, _month);
    setFilters("appt_date", "$year-$month-$date", fetch: true);
  }

  void setYear(int year) {
    _year = year;
    notifyListeners();
    getDaysInMonth(_year, _month);
    setFilters("appt_date", "$year-$month-$date", fetch: true);
  }

  void updateDate(DateTime value) {
    form.control('appt_date').updateValue(value);
    notifyListeners();
  }

  void updateTime(String value) {
    form.control('appt_time').updateValue(value);
    notifyListeners();
  }

  void clearForm() {
    form.control('patient_id').value = null;
    form.control('appt_date').value = DateTime.now();
    form.control('appt_time').value = null;
  }

  Future<void> submit(BuildContext context) async {
    if (!form.valid) {
      // Collect the names of the controls that are invalid
      List<String> missingFields = [];

      if (form.control('patient_id').invalid) {
        missingFields.add('Patient ID');
      }
      if (form.control('appt_date').invalid) {
        missingFields.add('Appointment Date');
      }
      if (form.control('appt_time').invalid) {
        missingFields.add('Appointment Time');
      }

      showError('${missingFields.join('\n')} is missing');
    } else {
      final data = {
        'patient_id': form.control('patient_id').value,
        'appt_date': (form.control('appt_date').value as DateTime).apiDate,
        'appt_time': form.control('appt_time').value,
      };

      await createEntity(context, data);
      if ((form.control('appt_date').value as DateTime).date ==
          DateTime.now().date) {
        getUpcomingAppointment(force: true);
      }
    }
  }

  @override
  void handleNavigation(BuildContext context, AppointmentResponse entity) {
    successBookingSheet(
        context, entity.name, entity.apptTime, entity.apptDate.date, () {
      if (context.mounted) {
        context.goNamed(AppScreens.dashboard.name);
        clearForm();
      }
    });
  }

  //APIs
  Future<void> getUpcomingAppointment({bool force = false}) async {
    if (_upcomingAppointment.isNotEmpty && !force) {
      return;
    }
    try {
      updateStatus(Status.loading);
      final data = await _repo.upcomingAppt();
      data.when(
        success: (success) {
          _upcomingAppointment = success;
          if (_upcomingAppointment.isNotEmpty) {
            updateStatus(Status.success);
          } else {
            updateStatus(Status.empty);
          }
        },
        failure: (failure) {
          updateStatus(Status.error);
        },
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      updateStatus(Status.error);
    }
  }
}
