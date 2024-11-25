import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:firebase_core/firebase_core.dart'; 
import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import 'package:wqm_app/firebase_options.dart';
import 'package:wqm_app/pages/signup_page.dart'; 
import 'package:wqm_app/state_manager.dart'; 
import 'package:wqm_app/pages/wqm_home.dart'; 
import 'package:google_fonts/google_fonts.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(38, 155, 255, 1),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(67, 167, 255, 1),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: StreamBuilder(
                stream: FirebaseAuth.instance
                    .authStateChanges(), //idTokenChanges //userChanges
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ));
                  }
                  if (snapshot.data != null) {
                    return const WqmHomeState();
                  }
                  return const SignupPage();
                })));
  }
}
