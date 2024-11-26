import 'package:flutter/material.dart';
// import 'package:radial_progress/radial_progress.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialProgressBar extends StatefulWidget {
  final double level;

  const RadialProgressBar({super.key, required this.level});

  @override
  State<RadialProgressBar> createState() => _RadialProgressBarState();
}

// class _RadialProgressBarState extends State<RadialProgressBar> {
//   @override
//   Widget build(BuildContext context) {
//     return RadialProgressWidget(
//       percent: (widget.level) / 100,
//       diameter: 180,
//       bgLineColor: Colors.grey.withOpacity(0.2),
//       progressLineWidth: 20,
//       startAngle: StartAngle.top,
//       progressLineColors: const [Color.fromRGBO(38, 155, 255, 1)],
//       centerChild: Text(
//         '${widget.level.toString()} %',
//         maxLines: 1,
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

class _RadialProgressBarState extends State<RadialProgressBar> {
  final List<ProgressData> chartData = [
    ProgressData('Water Level', const Color.fromRGBO(38, 155, 255, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // The radial progress chart
        SfCircularChart(
          margin: EdgeInsets.zero,
          series: <CircularSeries>[
            RadialBarSeries<ProgressData, String>(
              dataSource: chartData,
              xValueMapper: (ProgressData data, _) => data.category,
              yValueMapper: (ProgressData data, _) => widget.level,
              pointColorMapper: (ProgressData data, _) => data.color,
              cornerStyle: CornerStyle.bothCurve,
              radius: '90%',
              innerRadius: '81%',
              trackOpacity: 0.2,
              trackColor: Colors.grey,
              maximumValue: 100,
              animationDelay: 2000,
              animationDuration: 2000,
            )
          ],
        ),

        // Centered label
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.level}%', // add raspi-value
              maxLines: 1,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProgressData {
  final String category;
  final Color color;

  ProgressData(this.category, this.color);
}
