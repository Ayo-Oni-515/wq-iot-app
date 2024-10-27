import 'package:flutter/material.dart'; //Imports Material Design.
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
    return MaterialApp(
      title: 'WQM App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(227, 242, 253, 1),
          primary: Color.fromRGBO(126, 209, 248, 1),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(const TextTheme(
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          // color: Color.fromRGBO(45, 62, 78, 1)),
          titleMedium: TextStyle(
            fontSize: 23,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
          ),
        )),
      ),
      debugShowCheckedModeBanner: false,
      home: WqmHomeState(),
    );
  }
}
