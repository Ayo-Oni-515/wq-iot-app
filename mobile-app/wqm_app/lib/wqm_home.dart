import 'package:flutter/material.dart';
import 'cards.dart';

class WqmHomeState extends StatefulWidget {
  const WqmHomeState({super.key});

  @override
  State<WqmHomeState> createState() => _WqmHomeStateState();
}

class _WqmHomeStateState extends State<WqmHomeState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: Text(
            'WQM App',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //WQI Chart Chart: Use Gauge Chart
                  WaterMainCard(
                    cardTitle: 'WQI',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  WaterMainCard(
                    cardTitle: 'Water Level',
                  ),

                  //Water Level Chart: Use Liquid Progress Indicator
                  SizedBox(
                    height: 20,
                  ),
                  //Parameter List. Make a List view Builder
                  Text(
                    'Parameters',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  //Parameter 1
                  ParameterListCard(parameter: 'pH', parameterValue: 7.1),
                  ParameterListCard(
                    parameter: 'pH',
                    parameterValue: 7.1,
                    displayIcon: Icon(Icons.temple_buddhist),
                  ),
                  ParameterListCard(parameter: 'pH', parameterValue: 7.1),
                  ParameterListCard(parameter: 'pH', parameterValue: 7.1),
                  const Text(
                    'view more...',
                  ),

                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {});
            },
            iconSize: 30,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: const [
              BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.build))
            ]));
  }
}
