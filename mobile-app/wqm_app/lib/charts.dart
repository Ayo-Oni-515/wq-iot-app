import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
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

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
// Charts => End
