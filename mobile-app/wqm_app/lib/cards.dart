import 'package:flutter/material.dart';

// Cards => Start
//Use Line chart for trends page
class WaterMainCard extends StatelessWidget {
  final String cardTitle;
  final Widget trendPage;

  const WaterMainCard(
      {super.key,
      required this.cardTitle,
      this.trendPage = const UnderConstruction()});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return trendPage;
        }));
      },
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          // color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(cardTitle,
                    style: TextStyle(
                        fontSize: 23,
                        // color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.water_drop,
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return UnderConstruction();
        }));
      },
      child: SizedBox(
          width: double.infinity,
          child: Card(
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
                  subtitle: Text('% change'),
                )),
          )),
    );
  }
}
// Card => End

//Pages => Start
class PumpControlPage extends StatelessWidget {
  const PumpControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.build,
              size: 50,
            ),
            Text('This page is still under construction'),
          ],
        ),
      ),
    );
  }
}

//To be renamed Trends Page
class UnderConstruction extends StatelessWidget {
  const UnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trends Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.build,
                size: 50,
              ),
              Text('This page is still under construction'),
            ],
          ),
        ),
      ),
    );
  }
}
// Pages => End


// Row(
//                 children: [
//                   displayIcon,
//                   Text(
//                     'pH',
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   SizedBox(
//                     width: 260,
//                   ),
//                   Text(
//                     'value',
//                     style: Theme.of(context).textTheme.titleSmall,
//                   )
//                 ],
//               ),