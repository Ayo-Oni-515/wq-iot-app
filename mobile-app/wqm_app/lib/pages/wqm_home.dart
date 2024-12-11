import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wqm_app/cards/main_card.dart';
import 'package:wqm_app/cards/parameter_list_card.dart';
import 'package:wqm_app/cards/pump_activity_card.dart';
import 'package:wqm_app/cards/pump_control_mode_card.dart';
import 'package:wqm_app/cards/pump_switch_card.dart';
import 'package:wqm_app/charts/radial_gauge.dart';
import 'package:wqm_app/charts/radial_progress_bar.dart';
import 'package:wqm_app/pages/login_page.dart';
import 'package:wqm_app/pages/notifications_centre_page.dart';
import 'package:wqm_app/pages/parameter_list_page.dart';

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
    final currentUser = FirebaseAuth.instance.currentUser!.email;
    //On logout reset pump switch & mode
    try {
      await FirebaseAuth.instance.signOut();
      await FirebaseFirestore.instance
          .collection('pumpControl') // Replace with your collection name
          .doc('fCgyfcht2wPkn1TJ05KE') // Replace with your document ID
          .update({'switch': false});
      await FirebaseFirestore.instance
          .collection('pumpControl') // Replace with your collection name
          .doc('fCgyfcht2wPkn1TJ05KE') // Replace with your document ID
          .update({'mode': 'Auto'});
      // await FirebaseFirestore.instance.clearPersistence(); // Clear Firestore cache
      if (mounted) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Logged out successfully as\n$currentUser')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Logout Failed!')));
      }
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
          automaticallyImplyLeading: false, // Hide the back navigation button
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
                if (value == 'Logout') {
                  logout();
                }
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
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('waterParameters').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Raspi Synchronization Failed.'));
        }
        final waterData = snapshot.data!;
        final waterParameters = waterData.docs[0].data();
        final String raspiWQI = waterParameters['wqi'].toString();
        final String raspiPH = waterParameters['ph'].toString();
        final String raspiTemperature =
            waterParameters['temperature'].toString();
        final String raspiTurbidity = waterParameters['turbidity'].toString();
        final String raspiTDS = waterParameters['tds'].toString();
        final String raspiEC = waterParameters['ec'].toString();
        // print(waterParameters['ph']);
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainCard(
                    cardTitle: 'WQI',
                    chartType: RadialGauge(
                        level: double.parse(raspiWQI)), //Add raspi_value
                    fireStoreEntry: 'wqi',
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
                    parameterValue: double.parse(raspiPH), //Add raspi-vaule
                    displayIcon: 'assets/icons/ph_icon.png',
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  //Parameter 2
                  ParameterListCard(
                    parameter: 'Temperature',
                    parameterValue:
                        double.parse(raspiTemperature), //Add raspi-vaule
                    displayIcon: 'assets/icons/temperature_icon.png',
                    unit: '°C',
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  //Parameter 3
                  ParameterListCard(
                    parameter: 'Turbidity',
                    parameterValue:
                        double.parse(raspiTurbidity), //Add raspi-vaule
                    displayIcon: 'assets/icons/turbidity_icon.png',
                    unit: 'NTU',
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  //Parameter 4
                  ParameterListCard(
                    parameter: 'Total Dissolved Solids',
                    parameterValue: double.parse(raspiTDS), //Add raspi-vaule
                    displayIcon: 'assets/icons/tds_icon.png',
                    unit: 'ppm',
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  //Parameter 5
                  ParameterListCard(
                    parameter: 'Electrical Conductivity',
                    parameterValue: double.parse(raspiEC), //Add raspi-vaule
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
      },
    );
  }
}

class PumpControlPage extends StatelessWidget {
  const PumpControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('pumpControl').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Raspi Synchronization Failed.'));
        }
        final pumpData = snapshot.data!;
        final pumpControl = pumpData.docs[0].data();
        final raspiWaterLevel = pumpControl['water_level'].toString();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    //Water Level Chart: Use Liquid Progress Indicator
                    MainCard(
                      cardTitle: 'Water Level',
                      chartType: RadialProgressBar(
                          //Radial Bar only responds to reloads.
                          level:
                              double.parse(raspiWaterLevel)), //Add raspi_value
                      fireStoreEntry: 'water_level',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PumpActivityCard(),
                    SizedBox(
                      height: 10,
                    ),
                    PumpControlModeCard(),
                    SizedBox(
                      height: 10,
                    ),
                    PumpSwitchCard()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
