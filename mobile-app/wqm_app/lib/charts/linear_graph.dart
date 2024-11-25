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
          xValueMapper: (WaterQualityData data, _) => data.month,
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
    WaterQualityData('Jan', 30),
    WaterQualityData('Feb', 40),
    WaterQualityData('Mar', 28),
    WaterQualityData('Apr', 32),
    WaterQualityData('May', 44),
    WaterQualityData('Jun', 50),
    WaterQualityData('Jul', 45),
    WaterQualityData('Aug', 60),
    WaterQualityData('Sept', 65),
    WaterQualityData('Oct', 25),
    WaterQualityData('Nov', 100),
    WaterQualityData('Dec', 63),
  ];
}

class WaterQualityData {
  WaterQualityData(this.month, this.value);

  final String month;
  final double value;
}
