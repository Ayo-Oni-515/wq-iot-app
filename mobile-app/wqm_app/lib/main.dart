import 'package:flutter/material.dart';
import 'package:wqm_app/wqm_home.dart';

void main() {
  runApp(WqmHome());
}

class WqmHome extends StatelessWidget {
  const WqmHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WQM App',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(244, 244, 244, 1)),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: WqmHomeState(),
    );
  }
}
