// Project imports:
import 'package:Medikalam/src/views/screens/dashboard/appointment_landing_screen.dart';
import 'package:Medikalam/src/views/screens/dashboard/more_info_screen.dart';
import 'package:Medikalam/src/views/screens/dashboard/patient_landing_screen.dart';
import 'package:Medikalam/src/views/screens/dashboard/today_appt/today_appointment.dart';

///Constants For Applications
class Constants {
  static const qrPrescription = 'assets/prescriptions/qr_prescription.png';
  static const icons = [
    'assets/icons/today.svg',
    'assets/icons/app.svg',
    'assets/icons/patient.svg',
    'assets/icons/more.svg'
  ];

  static const pages = [
    TodayAppointment(),
    AppointmentLandingPage(),
    PatientLandingPage(),
    MoreInfoPage()
  ];
  static const iconText = ['Today', 'Appoint.', 'Patients', 'More'];
  static const List<String> slots = [
    "10:45",
    "11:00",
    "11:15",
    "11:30",
    "11:45",
    "12:00",
    "12:15",
    "12:30",
    "12:45",
    "14:00",
    "14:15",
    "14:30",
    "14:45",
    "15:00",
    "15:15",
    "15:30",
    "15:45",
    "16:00",
    "16:15",
    "16:30",
    "16:45",
    "17:00"
  ];

  static const Map<int, String> monthAbbreviations = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

  static const Map<int, String> fullMonthAbbreviations = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };
}
