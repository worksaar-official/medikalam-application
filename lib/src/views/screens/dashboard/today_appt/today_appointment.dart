// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fl_chart/fl_chart.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/models/appointment/appointment_model.dart';
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart';
import 'package:Medikalam/src/providers/dashboard/dashboard_provider.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';
import 'package:Medikalam/src/views/mixins/pen_connection_mixin.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/search_field.dart';
import 'package:Medikalam/src/views/widgets/wrapper/shimmer_handler.dart';

class TodayAppointment extends StatefulWidget {
  const TodayAppointment({super.key});

  @override
  State<TodayAppointment> createState() => _TodayAppointmentState();
}

class _TodayAppointmentState extends State<TodayAppointment>
    with PenConnectionMixin<TodayAppointment> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardProvider>().getDashboardData();
      context.read<AppointmentProvider>().getUpcomingAppointment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: const Color(0xFF146399),
          onRefresh: () async {
            context
                .read<AppointmentProvider>()
                .getUpcomingAppointment(force: true);
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<PenProvider>(builder: (context, provider, child) {
                    return ShimmerHandler(
                      status: Provider.of<DashboardProvider>(context).status,
                      shimmer: headerShimmer(),
                      onSuccess: appointHeader(
                        theme: context.textTheme,
                        title: context
                            .read<DashboardProvider>()
                            .dashboardData
                            .greeting,
                        title1: context
                            .read<DashboardProvider>()
                            .dashboardData
                            .staffDetails
                            .fullName,
                        // icon: provider.connectedPen != null
                        //     ? 'assets/icons/c1.svg'
                        //     : 'assets/icons/c2.svg',
                        // ontap: () {
                        //   final clear = provider.connectedPen == null;
                        //   startListener();
                        //   startBle(clear: clear);
                        //   penConnectionBottomSheet(context: context);
                        // },
                      ),
                    );
                  }),
                  Gap(3.h),
                  SearchField(text: "Patients", controller: searchController),
                  Gap(3.h),
                  Row(
                    children: [
                      actionCard(
                        theme: context.textTheme,
                        onTap: () {
                          context.push(AppScreens.registerVisit.path);
                        },
                        icon: 'assets/icons/register_visit.svg',
                        title: 'Register Visit',
                      ),
                      /*
                      Gap(2.w),
                      actionCard(
                        theme: context.textTheme,
                        onTap: () {
                          context.push(AppScreens.patientLanding.path, extra: {
                            'operationMode': OperationMode.selection,
                            'showBottomSheet': false,
                          });
                        },
                        icon: 'assets/icons/book_appo.svg',
                        title: 'Book Appointment',
                      ),
                      */
                      Gap(2.w),
                      actionCard(
                        theme: context.textTheme,
                        onTap: () {
                          context.push(AppScreens.addDocuments.path);
                        },
                        icon: 'assets/icons/document.svg',
                        title: 'Add Documents',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(26),
                    decoration: BoxDecoration(
                      color: AppColors
                          .lightSky, // Background color of the container
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // if (context.read<PenProvider>().connectedPen != null) {
                        context.read<PrescriptionProvider>().isScan = false;
                        context.push(AppScreens.prescriptionPaper.path);
                        // } else {
                        //   showError("Please Connect to a Pen");
                        // }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add),
                          Text(
                            'New Prescription',
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.txtPrimary,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Appointments (5)',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'See all',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.txtPrimary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  */

                  // Gap(2.h),
                  /*
                  Consumer<AppointmentProvider>(
                    builder: (context, apptProvide, child) {
                      return StatusHandler(
                        status: apptProvide.upcomingStatus,
                        onSuccess: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: apptProvide.upcomingAppointment.length,
                          itemBuilder: (context, index) {
                            final appt = apptProvide.upcomingAppointment[index];
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 1.w),
                                  child: PatientCard(
                                      title: appt.name,
                                      desc: appt.apptTime,
                                      theme: context.textTheme,
                                      divider: false),
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  */
                  SizedBox(
                    height: 1.h,
                  ),
                  // Hiding Appointment (statistic) section on home screen
                  const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentStatistics extends StatelessWidget {
  const AppointmentStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);
    final appointments = provider.filteredAppointments;
    final monthlyStats = _getMonthlyStats(appointments);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
          child: BarChart(
            BarChartData(
              barGroups: monthlyStats.entries
                  .map(
                    (entry) => BarChartGroupData(
                      x: _monthToInt(entry.key),
                      barRods: [
                        BarChartRodData(
                          toY: entry.value.toDouble(),
                          color: const Color(0xff24EBAE),
                          width: 20,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              titlesData: FlTitlesData(
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) => Text(
                      _intToMonth(value.toInt()),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                drawVerticalLine: false,
                show: true,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    dashArray: null,
                    strokeWidth: 0.2,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Total - ${appointments.length}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// Generate monthly statistics
  Map<String, int> _getMonthlyStats(List<AppointmentResponse> appointments) {
    final stats = <String, int>{};
    for (var appt in appointments) {
      final month = DateFormat('MMM').format(appt.apptDate);
      stats[month] = (stats[month] ?? 0) + 1;
    }

    // Sort by month
    final sortedStats = Map.fromEntries(
      stats.entries.toList()
        ..sort((a, b) => _monthToInt(a.key).compareTo(_monthToInt(b.key))),
    );

    return sortedStats;
  }

  String _intToMonth(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  int _monthToInt(String month) {
    const months = {
      'Jan': 1,
      'Feb': 2,
      'Mar': 3,
      'Apr': 4,
      'May': 5,
      'Jun': 6,
      'Jul': 7,
      'Aug': 8,
      'Sep': 9,
      'Oct': 10,
      'Nov': 11,
      'Dec': 12,
    };
    return months[month] ?? 1;
  }
}

final List<AppointmentResponse> dummyAppointments = [
  // Last 3 Months
  AppointmentResponse(
    id: '1',
    patientId: 'P1001',
    name: 'Alice Johnson',
    apptDate: DateTime.now().subtract(const Duration(days: 20)), // ~1 month ago
    apptTime: '10:00 AM',
    editorId: 'E2001',
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
  ),
  AppointmentResponse(
    id: '2',
    patientId: 'P1002',
    name: 'John Smith',
    apptDate:
        DateTime.now().subtract(const Duration(days: 45)), // ~1.5 months ago
    apptTime: '2:30 PM',
    editorId: 'E2002',
    createdAt: DateTime.now().subtract(const Duration(days: 50)),
  ),
  AppointmentResponse(
    id: '3',
    patientId: 'P1003',
    name: 'Bob Williams',
    apptDate:
        DateTime.now().subtract(const Duration(days: 75)), // ~2.5 months ago
    apptTime: '11:15 AM',
    editorId: 'E2003',
    createdAt: DateTime.now().subtract(const Duration(days: 90)),
  ),

  // Last 6 Months
  AppointmentResponse(
    id: '4',
    patientId: 'P1004',
    name: 'Emma Davis',
    apptDate:
        DateTime.now().subtract(const Duration(days: 120)), // ~4 months ago
    apptTime: '3:00 PM',
    editorId: 'E2004',
    createdAt: DateTime.now().subtract(const Duration(days: 130)),
  ),
  AppointmentResponse(
    id: '5',
    patientId: 'P1005',
    name: 'Liam Brown',
    apptDate:
        DateTime.now().subtract(const Duration(days: 150)), // ~5 months ago
    apptTime: '9:45 AM',
    editorId: 'E2005',
    createdAt: DateTime.now().subtract(const Duration(days: 160)),
  ),
  AppointmentResponse(
    id: '6',
    patientId: 'P1006',
    name: 'Sophia Martinez',
    apptDate:
        DateTime.now().subtract(const Duration(days: 180)), // ~6 months ago
    apptTime: '1:00 PM',
    editorId: 'E2006',
    createdAt: DateTime.now().subtract(const Duration(days: 190)),
  ),

  // Last 12 Months
  AppointmentResponse(
    id: '7',
    patientId: 'P1007',
    name: 'James Taylor',
    apptDate:
        DateTime.now().subtract(const Duration(days: 210)), // ~7 months ago
    apptTime: '4:30 PM',
    editorId: 'E2007',
    createdAt: DateTime.now().subtract(const Duration(days: 220)),
  ),
  AppointmentResponse(
    id: '8',
    patientId: 'P1008',
    name: 'Olivia White',
    apptDate:
        DateTime.now().subtract(const Duration(days: 270)), // ~9 months ago
    apptTime: '10:15 AM',
    editorId: 'E2008',
    createdAt: DateTime.now().subtract(const Duration(days: 280)),
  ),
  AppointmentResponse(
    id: '9',
    patientId: 'P1009',
    name: 'Charlotte Green',
    apptDate:
        DateTime.now().subtract(const Duration(days: 360)), // ~12 months ago
    apptTime: '8:45 AM',
    editorId: 'E2009',
    createdAt: DateTime.now().subtract(const Duration(days: 370)),
  ),
  AppointmentResponse(
    id: '10',
    patientId: 'P1010',
    name: 'Mia Walker',
    apptDate: DateTime(2024, 12, 5, 10, 30), // December 5, 2024
    apptTime: '10:30 AM',
    editorId: 'E2010',
    createdAt: DateTime(2024, 11, 20),
  ),
  AppointmentResponse(
    id: '11',
    patientId: 'P1011',
    name: 'Noah Adams',
    apptDate: DateTime(2024, 12, 12, 14, 15), // December 12, 2024
    apptTime: '2:15 PM',
    editorId: 'E2011',
    createdAt: DateTime(2024, 11, 25),
  ),
  AppointmentResponse(
    id: '12',
    patientId: 'P1012',
    name: 'Ella Carter',
    apptDate: DateTime(2024, 12, 18, 9, 00), // December 18, 2024
    apptTime: '9:00 AM',
    editorId: 'E2012',
    createdAt: DateTime(2024, 11, 28),
  ),
  AppointmentResponse(
    id: '13',
    patientId: 'P1013',
    name: 'Liam Harris',
    apptDate: DateTime(2024, 12, 22, 11, 45), // December 22, 2024
    apptTime: '11:45 AM',
    editorId: 'E2013',
    createdAt: DateTime(2024, 12, 1),
  ),
  AppointmentResponse(
    id: '14',
    patientId: 'P1014',
    name: 'Ava Mitchell',
    apptDate: DateTime(2024, 12, 29, 16, 00), // December 29, 2024
    apptTime: '4:00 PM',
    editorId: 'E2014',
    createdAt: DateTime(2024, 12, 5),
  ),

  // Last 12 months with at least 5 entries per month

  // March 2024
  AppointmentResponse(
      id: '1',
      patientId: 'P1001',
      name: 'Alice Johnson',
      apptDate: DateTime(2024, 3, 5),
      apptTime: '10:00 AM',
      editorId: 'E2001',
      createdAt: DateTime(2024, 2, 20)),
  AppointmentResponse(
      id: '2',
      patientId: 'P1002',
      name: 'Bob Smith',
      apptDate: DateTime(2024, 3, 12),
      apptTime: '2:30 PM',
      editorId: 'E2002',
      createdAt: DateTime(2024, 2, 25)),
  AppointmentResponse(
      id: '3',
      patientId: 'P1003',
      name: 'Emma Brown',
      apptDate: DateTime(2024, 3, 18),
      apptTime: '11:15 AM',
      editorId: 'E2003',
      createdAt: DateTime(2024, 2, 28)),
  AppointmentResponse(
      id: '4',
      patientId: 'P1004',
      name: 'Liam Green',
      apptDate: DateTime(2024, 3, 22),
      apptTime: '3:45 PM',
      editorId: 'E2004',
      createdAt: DateTime(2024, 3, 1)),
  AppointmentResponse(
      id: '5',
      patientId: 'P1005',
      name: 'Sophia Lee',
      apptDate: DateTime(2024, 3, 28),
      apptTime: '9:00 AM',
      editorId: 'E2005',
      createdAt: DateTime(2024, 3, 2)),

  // April 2024
  AppointmentResponse(
      id: '6',
      patientId: 'P1006',
      name: 'James White',
      apptDate: DateTime(2024, 4, 4),
      apptTime: '1:00 PM',
      editorId: 'E2006',
      createdAt: DateTime(2024, 3, 20)),
  AppointmentResponse(
      id: '7',
      patientId: 'P1007',
      name: 'Olivia Martinez',
      apptDate: DateTime(2024, 4, 10),
      apptTime: '2:45 PM',
      editorId: 'E2007',
      createdAt: DateTime(2024, 3, 25)),
  AppointmentResponse(
      id: '8',
      patientId: 'P1008',
      name: 'Charlotte Wilson',
      apptDate: DateTime(2024, 4, 15),
      apptTime: '10:30 AM',
      editorId: 'E2008',
      createdAt: DateTime(2024, 3, 30)),
  AppointmentResponse(
      id: '9',
      patientId: 'P1009',
      name: 'Daniel Taylor',
      apptDate: DateTime(2024, 4, 21),
      apptTime: '4:15 PM',
      editorId: 'E2009',
      createdAt: DateTime(2024, 4, 1)),
  AppointmentResponse(
      id: '10',
      patientId: 'P1010',
      name: 'Ella Harris',
      apptDate: DateTime(2024, 4, 29),
      apptTime: '8:00 AM',
      editorId: 'E2010',
      createdAt: DateTime(2024, 4, 2)),

  // May 2024
  AppointmentResponse(
      id: '11',
      patientId: 'P1011',
      name: 'Mia Anderson',
      apptDate: DateTime(2024, 5, 6),
      apptTime: '9:15 AM',
      editorId: 'E2011',
      createdAt: DateTime(2024, 4, 20)),
  AppointmentResponse(
      id: '12',
      patientId: 'P1012',
      name: 'Lucas Brown',
      apptDate: DateTime(2024, 5, 12),
      apptTime: '11:45 AM',
      editorId: 'E2012',
      createdAt: DateTime(2024, 4, 25)),
  AppointmentResponse(
      id: '13',
      patientId: 'P1013',
      name: 'Ava Martinez',
      apptDate: DateTime(2024, 5, 17),
      apptTime: '3:00 PM',
      editorId: 'E2013',
      createdAt: DateTime(2024, 4, 30)),
  AppointmentResponse(
      id: '14',
      patientId: 'P1014',
      name: 'Noah Garcia',
      apptDate: DateTime(2024, 5, 23),
      apptTime: '2:15 PM',
      editorId: 'E2014',
      createdAt: DateTime(2024, 5, 1)),
  AppointmentResponse(
      id: '15',
      patientId: 'P1015',
      name: 'Amelia Clark',
      apptDate: DateTime(2024, 5, 30),
      apptTime: '10:00 AM',
      editorId: 'E2015',
      createdAt: DateTime(2024, 5, 2)),

  // June 2024
  AppointmentResponse(
      id: '16',
      patientId: 'P1016',
      name: 'Ethan Young',
      apptDate: DateTime(2024, 6, 5),
      apptTime: '11:00 AM',
      editorId: 'E2016',
      createdAt: DateTime(2024, 5, 20)),
  AppointmentResponse(
      id: '17',
      patientId: 'P1017',
      name: 'Harper King',
      apptDate: DateTime(2024, 6, 11),
      apptTime: '9:30 AM',
      editorId: 'E2017',
      createdAt: DateTime(2024, 5, 25)),
  AppointmentResponse(
      id: '18',
      patientId: 'P1018',
      name: 'Benjamin Scott',
      apptDate: DateTime(2024, 6, 18),
      apptTime: '3:45 PM',
      editorId: 'E2018',
      createdAt: DateTime(2024, 5, 30)),
  AppointmentResponse(
      id: '19',
      patientId: 'P1019',
      name: 'Zoe Hall',
      apptDate: DateTime(2024, 6, 24),
      apptTime: '2:00 PM',
      editorId: 'E2019',
      createdAt: DateTime(2024, 6, 1)),
  AppointmentResponse(
      id: '20',
      patientId: 'P1020',
      name: 'Henry Lewis',
      apptDate: DateTime(2024, 6, 28),
      apptTime: '10:45 AM',
      editorId: 'E2020',
      createdAt: DateTime(2024, 6, 2)),

  // July 2024
  AppointmentResponse(
      id: '21',
      patientId: 'P1021',
      name: 'Grace Robinson',
      apptDate: DateTime(2024, 7, 4),
      apptTime: '1:30 PM',
      editorId: 'E2021',
      createdAt: DateTime(2024, 6, 20)),
  AppointmentResponse(
      id: '22',
      patientId: 'P1022',
      name: 'Jack Walker',
      apptDate: DateTime(2024, 7, 10),
      apptTime: '3:00 PM',
      editorId: 'E2022',
      createdAt: DateTime(2024, 6, 25)),
  AppointmentResponse(
      id: '23',
      patientId: 'P1023',
      name: 'Lily Carter',
      apptDate: DateTime(2024, 7, 17),
      apptTime: '11:30 AM',
      editorId: 'E2023',
      createdAt: DateTime(2024, 6, 30)),
  AppointmentResponse(
      id: '24',
      patientId: 'P1024',
      name: 'Ryan Adams',
      apptDate: DateTime(2024, 7, 22),
      apptTime: '2:45 PM',
      editorId: 'E2024',
      createdAt: DateTime(2024, 7, 1)),
  AppointmentResponse(
      id: '25',
      patientId: 'P1025',
      name: 'Chloe Nelson',
      apptDate: DateTime(2024, 7, 29),
      apptTime: '10:15 AM',
      editorId: 'E2025',
      createdAt: DateTime(2024, 7, 2)),
];
