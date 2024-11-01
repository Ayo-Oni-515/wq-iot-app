import 'package:flutter/material.dart';
import 'package:wqm_app/pages.dart';
import 'cards.dart';

// This is the home dart file for the flutter app.

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
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),

          title: Text(
            'WQM App',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.sync))
          ],
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
              MainCard(
                cardTitle: 'WQI',
              ),
              SizedBox(
                height: 10,
              ),
              MainCard(
                cardTitle: 'Water Level',
              ),
              //Water Level Chart: Use Liquid Progress Indicator
              SizedBox(
                height: 30,
              ),
              //Parameter List. Make a List view Builder
              Text(
                'Parameters',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              //Parameter 1
              ParameterListCard(
                parameter: 'pH',
                parameterValue: 7.1, //Add raspi-vaule
                displayIcon: 'assets/icons/ph_icon.png',
              ),
              ParameterListCard(
                parameter: 'Temperature',
                parameterValue: 25, //Add raspi-vaule
                displayIcon: 'assets/icons/temperature_icon.png',
                unit: '°C',
              ),
              ParameterListCard(
                parameter: 'Turbidity',
                parameterValue: 20, //Add raspi-vaule
                displayIcon: 'assets/icons/turbidity_icon.png',
                unit: 'NTU',
              ),
              ParameterListCard(
                parameter: 'Total Dissolved Solids',
                parameterValue: 500, //Add raspi-vaule
                displayIcon: 'assets/icons/tds_icon.png',
                unit: 'ppm',
              ),
              ParameterListCard(
                parameter: 'Electrical Conductivity',
                parameterValue: 1000, //Add raspi-vaule
                displayIcon: 'assets/icons/ec_icon.png',
                unit: 'µS/cm',
              ),
              //Add colour change to the "view more..." text
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return WaterParameterListPage();
                  }));
                },
                child: const Text(
                  'view more...',
                  style: TextStyle(
                    color: Color.fromARGB(255, 76, 163, 234),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
