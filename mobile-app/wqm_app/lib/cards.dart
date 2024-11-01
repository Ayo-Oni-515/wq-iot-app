import 'package:flutter/material.dart';
import 'package:wqm_app/charts.dart';

// Cards => Start
//Use Line chart for Overview
class MainCard extends StatefulWidget {
  final String cardTitle;

  const MainCard({super.key, required this.cardTitle});

  @override
  State<MainCard> createState() => _WaterMainCardState();
}

class _WaterMainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Card(
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        // color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(widget.cardTitle,
                  style: TextStyle(
                      fontSize: 23,
                      // color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                  height: 219, child: RadialGauge(level: 0)), //Add raspi-vaule
            ],
          ),
        ),
      ),
    );
  }
}

class ParameterListCard extends StatelessWidget {
  final String parameter;
  final double parameterValue;
  final String displayIcon;
  final String unit;

  const ParameterListCard(
      {super.key,
      required this.parameter,
      required this.parameterValue,
      this.unit = '',
      this.displayIcon = 'assets/icons/default_icon.png'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          shadowColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(displayIcon),
                ),
                trailing: Text(
                  '${parameterValue.toString()} $unit',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                title: Text(parameter),
                subtitle: Row(children: [
                  Icon(Icons.arrow_drop_up),
                  Text('3.5%'),
                ]),
              )),
        ));
  }
}
// Card => End

