import 'package:flutter/material.dart';

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SANDBOX"),
          backgroundColor: Colors.grey[600],
          centerTitle: true,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.red[200],
              child: const Text("Row 1"),
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.amber[200],
              child: const Text("Row 2"),
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.green[200],
              child: const Text("Row 3"),
            ),
          ],
        )
        // body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //       width: 100,
        //       color: Colors.blue[200],
        //       child: const Text('One'),
        //     ),
        //     Container(
        //       width: 100,
        //       color: Colors.yellow[200],
        //       child: const Text('Two'),
        //     ),
        //     Container(
        //       width: 100,
        //       color: Colors.red[300],
        //       child: const Text('Three'),
        //     ),
        //   ],
        // ),
        );
  }
}
