// // Flutter imports:
// import 'package:flutter/material.dart';

// // Package imports:
// import 'package:syncfusion_flutter_charts/charts.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   final List<ChartData> chartData = [
//     ChartData('China', 12, 10, 14, 20),
//     ChartData('USA', 14, 11, 18, 23),
//     ChartData('UK', 16, 10, 15, 20),
//     ChartData('Brazil', 18, 16, 18, 24),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       primaryXAxis: const CategoryAxis(),
//       series: <CartesianSeries<dynamic, dynamic>>[
//         StackedColumnSeries<ChartData, String>(
//           groupName: 'Group A',
//           dataSource: chartData,
//           xValueMapper: (ChartData data, _) => data.x,
//           yValueMapper: (ChartData data, _) => data.y1,
//         ),
//         StackedColumnSeries<ChartData, String>(
//           groupName: 'Group B',
//           dataSource: chartData,
//           xValueMapper: (ChartData data, _) => data.x,
//           yValueMapper: (ChartData data, _) => data.y2,
//         ),
//       ],
//     );
//   }
// }

// class ChartData {
//   ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
//   final String x;
//   final double y1;
//   final double y2;
//   final double y3;
//   final double y4;
// }
