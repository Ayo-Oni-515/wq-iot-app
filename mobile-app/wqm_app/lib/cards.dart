import 'package:flutter/material.dart';

//Use Line chart for trends page

class WaterMainCard extends StatelessWidget {
  final String cardTitle;

  const WaterMainCard({super.key, required this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(cardTitle,
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.water,
                  size: 150,
                ),
                Text('Sample Text')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Include in Pump control Page**
// Text(
//                   'Pump Control',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),

class WaterParameterCard extends StatelessWidget {
  const WaterParameterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PumpControlCard extends StatelessWidget {
  const PumpControlCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        elevation: 0.0,
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Pump Control',
                style: TextStyle(
                  fontSize: 25,
                ),
              )
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
  final Icon displayIcon;

  const ParameterListCard(
      {super.key,
      required this.parameter,
      required this.parameterValue,
      this.displayIcon = const Icon(Icons.water)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                displayIcon,
                Text(
                  'pH',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  width: 260,
                ),
                Text(
                  'value',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
        ));
  }
}
