import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LinearChart extends StatefulWidget {
  final String chartHeader;
  final String fireStoreEntry;
  const LinearChart(
      {super.key, required this.chartHeader, required this.fireStoreEntry});

  @override
  State<LinearChart> createState() => _LinearChartState();
}

class _LinearChartState extends State<LinearChart> {
  late Stream<List<WaterQualityData>> store;

  @override
  void initState() {
    super.initState();
    store = fetchDataStore(widget.fireStoreEntry);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: store,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );          }
          if (snapshot.hasError) {
            return Center(child: Text('Firestore Synchronization Failed.'));
          }

          final data = snapshot.data!;

          return SfCartesianChart(
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.yMd(),
              intervalType: DateTimeIntervalType.days,
              majorGridLines: MajorGridLines(width: 0.8), // Thinner grid lines
              title: AxisTitle(text: 'Timestamp'),
            ), // X-Axis with category labels
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: ' ${widget.chartHeader}'),
              majorGridLines: MajorGridLines(width: 0.8), // Thinner grid lines
            ),
            title: ChartTitle(text: '${widget.chartHeader} Over Time'),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            zoomPanBehavior:
                ZoomPanBehavior(enablePanning: true, enablePinching: true),
            series: <LineSeries<WaterQualityData, DateTime>>[
              LineSeries<WaterQualityData, DateTime>(
                name: widget.chartHeader,
                dataSource: data, //Dynamic Data Updates
                xValueMapper: (WaterQualityData data, _) => data.timestamp,
                yValueMapper: (WaterQualityData data, _) => data.value,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                markerSettings: MarkerSettings(isVisible: true),
              ),
            ],
          );
        });
  }
}

Stream<List<WaterQualityData>> fetchDataStore(String? fireStoreEntry) {
  return FirebaseFirestore.instance
      .collection('datastore') // firestore collection name
      .orderBy('timestamp',
          descending: false) // sort by timestamp in ascending order
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return WaterQualityData(
        (data['timestamp'] as Timestamp).toDate(),
        (data[fireStoreEntry] as num).toDouble(),
      );
    }).toList();
  });
}

class WaterQualityData {
  WaterQualityData(this.timestamp, this.value);

  final DateTime timestamp;
  final double value;
}
