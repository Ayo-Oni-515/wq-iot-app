// This is the home dart file for the flutter app.

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Water Quality Monitor",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue[300],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  color: Colors.green[300],
                  child: const Text(
                    "WQI Pie Chart.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  color: Colors.orange[300],
                  child: const Text(
                    "Water Level.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ));
  }
}
