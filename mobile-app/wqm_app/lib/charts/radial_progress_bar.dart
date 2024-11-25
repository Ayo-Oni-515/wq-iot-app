import 'package:flutter/material.dart';
import 'package:radial_progress/radial_progress.dart';

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
