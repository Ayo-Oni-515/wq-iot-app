import 'package:flutter/material.dart';
import 'package:radial_progress/radial_progress.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Charts => Start
class RadialGauge extends StatefulWidget {
  final double level;

  const RadialGauge({super.key, required this.level});

  @override
  State<RadialGauge> createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 100,
              gradient: SweepGradient(
                colors: [
                  Color(0xFFFF5252),
                  Color(0xFFFFAB40),
                  Color(0xFFFFFF8D),
                  Color(0xFF69F0AE),
                ],
                stops: [0.0, 0.33, 0.66, 1.0],
              ),
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(value: widget.level),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                '${widget.level}%',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              angle: 90,
              positionFactor: 1,
            ),
          ],
        ),
      ],
    );
  }
}

class RadialProgressBar extends StatefulWidget {
  final double level;

  const RadialProgressBar({super.key, required this.level});

  @override
  State<RadialProgressBar> createState() => _RadialProgressBarState();
}

class _RadialProgressBarState extends State<RadialProgressBar> {
  @override
  Widget build(BuildContext context) {
    return RadialProgressWidget(
      percent: (widget.level) / 100,
      diameter: 180,
      bgLineColor: Colors.grey.withOpacity(0.2),
      progressLineWidth: 20,
      startAngle: StartAngle.top,
      progressLineColors: const [Color.fromRGBO(38, 155, 255, 1)],
      centerChild: Text(
        '${widget.level.toString()} %',
        maxLines: 1,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

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

// Charts => End
