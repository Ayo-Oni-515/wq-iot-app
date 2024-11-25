import 'package:flutter/material.dart';

class ParameterListCard extends StatelessWidget {
  final String parameter;
  final double? parameterValue;
  final String displayIcon;
  final String unit;

  const ParameterListCard(
      {super.key,
      required this.parameter,
      this.parameterValue = 0,
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
                  Icon(
                    Icons.arrow_drop_up, //Add raspi-value
                    color: Colors.green,
                  ), //Add raspi-value
                  Text(
                    '3.5%', //Add raspi-value
                    style: TextStyle(color: Colors.green),
                  ), //Add raspi-value
                ]),
              )),
        ));
  }
}
