// This is the home dart file for the flutter app.

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: const Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: const Text("Sample Text",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 4,
            decoration: TextDecoration.underline,
            fontStyle: FontStyle.italic,
          )),
    );
  }
}
