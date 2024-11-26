import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LinearChart extends StatefulWidget {
  final String chartHeader;
  const LinearChart({super.key, required this.chartHeader});

  @override
  State<LinearChart> createState() => _LinearChartState();
}

class _LinearChartState extends State<LinearChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(), // X-Axis with category labels
      title: ChartTitle(text: '${widget.chartHeader} Over Time'),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <LineSeries<WaterQualityData, String>>[
        LineSeries<WaterQualityData, String>(
          name: widget.chartHeader,
          dataSource: getWaterQualityData(),
          xValueMapper: (WaterQualityData data, _) => data.timestamp.toString(),
          yValueMapper: (WaterQualityData data, _) => data.value,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          markerSettings: MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}

List<WaterQualityData> getWaterQualityData() {
  return [
    WaterQualityData(DateTime.parse('2024-11-01T12:00:00Z'), 30),
    WaterQualityData(DateTime.parse('2024-11-02T12:00:00Z'), 20),
    WaterQualityData(DateTime.parse('2024-11-03T12:00:00Z'), 36),
    WaterQualityData(DateTime.parse('2024-11-04T12:00:00Z'), 20),
    WaterQualityData(DateTime.parse('2024-11-05T12:00:00Z'), 11),
    WaterQualityData(DateTime.parse('2024-11-06T12:00:00Z'), 78),
    WaterQualityData(DateTime.parse('2024-11-07T12:00:00Z'), 46),
    WaterQualityData(DateTime.parse('2024-11-08T12:00:00Z'), 78),
    WaterQualityData(DateTime.parse('2024-11-09T12:00:00Z'), 30),
    WaterQualityData(DateTime.parse('2024-11-10T12:00:00Z'), 101),

  ];
}

class WaterQualityData {
  WaterQualityData(this.timestamp, this.value);

  final DateTime timestamp;
  final double value;
}
