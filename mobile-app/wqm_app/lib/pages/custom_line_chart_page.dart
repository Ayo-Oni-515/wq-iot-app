import 'package:flutter/material.dart';
import 'package:wqm_app/charts/linear_graph.dart';

class CustomLineChartPage extends StatelessWidget {
  final String chartTitle;
  const CustomLineChartPage({super.key, required this.chartTitle});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 600,
              child: LinearChart(
                chartHeader: chartTitle,
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}