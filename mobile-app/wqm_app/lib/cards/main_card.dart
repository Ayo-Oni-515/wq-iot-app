import 'package:flutter/material.dart';
import 'package:wqm_app/pages/custom_line_chart_page.dart';

//Use Line chart for Overview
class MainCard extends StatefulWidget {
  final String cardTitle;
  final Widget chartType;
  final String fireStoreEntry;

  const MainCard(
      {super.key,
      required this.cardTitle,
      required this.chartType,
      required this.fireStoreEntry});

  @override
  State<MainCard> createState() => _WaterMainCardState();
}

class _WaterMainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CustomLineChartPage(
            chartTitle: widget.cardTitle,
            fireStoreEntry: widget.fireStoreEntry,
          );
        }));
      },
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Card(
          shadowColor: Theme.of(context).colorScheme.primary,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.cardTitle,
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                SizedBox(height: 219, child: widget.chartType),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
