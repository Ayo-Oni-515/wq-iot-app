import 'package:flutter/material.dart'; //Imports Material Design.
import 'package:provider/provider.dart'; //Imports the State Manager
import 'package:wqm_app/state_manager.dart'; //Imports Custom State Management Utility
import 'package:wqm_app/wqm_home.dart'; //Imports the Home Page of the WQM App.
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts.

void main() {
  runApp(WqmHome());
}

//Theming and Default Customizations
class WqmHome extends StatelessWidget {
  const WqmHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WQMProvider()),
        ChangeNotifierProvider(create: (context) => PumpModeProvider()),
        ChangeNotifierProvider(create: (context) => PumpSwitchProvider())
      ],
      child: MaterialApp(
        title: 'WQM App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(227, 242, 253, 1),
            primary: Color.fromRGBO(38, 155, 255, 1),
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(const TextTheme(
            titleMedium: TextStyle(
              fontSize: 23,
            ),
            titleSmall: TextStyle(
              fontSize: 18,
            ),
          )),
        ),
        debugShowCheckedModeBanner: false,
        home: WqmHomeState(),
      ),
    );
  }
}