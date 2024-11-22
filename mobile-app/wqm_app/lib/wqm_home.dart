import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wqm_app/charts.dart';
import 'package:wqm_app/pages.dart';
import 'package:wqm_app/signup_page.dart';
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

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignupPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //To be implemented in later versions
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),

          title: Text(
            'WQM App',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          automaticallyImplyLeading: false, // Hide the back button
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NotificationsCentrePage(); //NotificationsCentrePage
                  }));
                },
                icon: const Icon(Icons.notifications)),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Logout') logout();
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: 'Logout',
                      child: Text(
                        'Logout',
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                ];
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: currentScreen,
          children: screens,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              //Handles App Synchronization with Raspberry Pi.
            });
          },
          child: Icon(Icons.sync),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                //Handles Screen Navigation.
                currentScreen = value;
              });
            },
            currentIndex: currentScreen,
            iconSize: 30,
            selectedFontSize: 13,
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
                chartType: RadialGauge(level: 50), //Add raspi_value
              ),
              SizedBox(
                height: 30,
              ),
              //Parameter List. Make a List view Builder
              Text(
                'Parameters',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 4,
              ),
              //Parameter 1
              ParameterListCard(
                parameter: 'pH',
                parameterValue: 7.1, //Add raspi-vaule
                displayIcon: 'assets/icons/ph_icon.png',
              ),
              SizedBox(
                height: 4,
              ),
              //Parameter 2
              ParameterListCard(
                parameter: 'Temperature',
                parameterValue: 25, //Add raspi-vaule
                displayIcon: 'assets/icons/temperature_icon.png',
                unit: '°C',
              ),
              SizedBox(
                height: 4,
              ),
              //Parameter 3
              ParameterListCard(
                parameter: 'Turbidity',
                parameterValue: 20, //Add raspi-vaule
                displayIcon: 'assets/icons/turbidity_icon.png',
                unit: 'NTU',
              ),
              SizedBox(
                height: 4,
              ),
              //Parameter 4
              ParameterListCard(
                parameter: 'Total Dissolved Solids',
                parameterValue: 500, //Add raspi-vaule
                displayIcon: 'assets/icons/tds_icon.png',
                unit: 'ppm',
              ),
              SizedBox(
                height: 4,
              ),
              //Parameter 5
              ParameterListCard(
                parameter: 'Electrical Conductivity',
                parameterValue: 1000, //Add raspi-vaule
                displayIcon: 'assets/icons/ec_icon.png',
                unit: 'µS/cm',
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ParameterListPage();
                  }));
                },
                child: Text(
                  'view more...',
                  style: TextStyle(
                    color: Color.fromARGB(255, 76, 163, 234),
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
