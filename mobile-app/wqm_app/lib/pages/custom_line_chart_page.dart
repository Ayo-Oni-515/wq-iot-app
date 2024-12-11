import 'package:flutter/material.dart';
import 'package:wqm_app/charts/linear_graph.dart';

class CustomLineChartPage extends StatelessWidget {
  final String chartTitle;
  final String fireStoreEntry;
  const CustomLineChartPage(
      {super.key, required this.chartTitle, required this.fireStoreEntry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$chartTitle Overview',
          maxLines: 2,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height:
            MediaQuery.of(context).size.height * 0.85, // 85% of screen height
        child: LinearChart(
          chartHeader: chartTitle,
          fireStoreEntry: fireStoreEntry,
        ),
      ),
    );
  }
}
