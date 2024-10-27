import 'package:flutter/material.dart';
import 'cards.dart';

class WqmHomeState extends StatefulWidget {
  const WqmHomeState({super.key});

  @override
  State<WqmHomeState> createState() => _WqmHomeStateState();
}

class _WqmHomeStateState extends State<WqmHomeState> {
  int currentScreen = 0;

  List<Widget> screens = [HomePage(), PumpControlPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: Text(
            'WQM App',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.sync))],
        ),
        body: IndexedStack(
          index: currentScreen,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentScreen = value;
              });
            },
            currentIndex: currentScreen,
            iconSize: 30,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Pump Control', icon: Icon(Icons.water_drop))
            ]));
  }
}

//Home Page Screen
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              ParameterListCard(parameter: 'pH', parameterValue: 7.1, displayIcon: 'assets/icons/ph_icon.png',),
              ParameterListCard(parameter: 'Temperature', parameterValue: 25, displayIcon: 'assets/icons/temperature_icon.png', unit: '°C',),
              ParameterListCard(parameter: 'Turbidity', parameterValue: 20, displayIcon: 'assets/icons/turbidity_icon.png', unit: 'NTU',),
              ParameterListCard(parameter: 'Total Dissolved Solids', parameterValue: 7.1, displayIcon: 'assets/icons/tds_icon.png',),
              ParameterListCard(parameter: 'Electrical Conductivity', parameterValue: 7.1, displayIcon: 'assets/icons/ec_icon.png',),
              //Add colour change to the "view more..." text
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return UnderConstruction();
                  }));
                },
                child: const Text(
                  'view more...',
                ),
              ),

              // SizedBox(
              //   height: 5,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
