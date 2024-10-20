import 'package:flutter/material.dart';

class WqmHomeState extends StatefulWidget {
  const WqmHomeState({super.key});

  @override
  State<WqmHomeState> createState() => _WqmHomeStateState();
}

class _WqmHomeStateState extends State<WqmHomeState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'WQM App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //WQI Chart & Water Level Chart
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 175,
                      width: 175,
                      child: Placeholder(),
                    ),
                    SizedBox(
                      height: 175,
                      width: 175,
                      child: Placeholder(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //Parameter List.
                const Text(
                  'Parameter List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  child: Column(children: [
                    //Parameter 1
                    SizedBox(
                      height: 50,
                      child: Placeholder(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Parameter 2
                    SizedBox(
                      height: 50,
                      child: Placeholder(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Parameter 3
                    SizedBox(
                      height: 50,
                      child: Placeholder(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Parameter 4
                    SizedBox(
                      height: 50,
                      child: Placeholder(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Parameter 5
                    SizedBox(
                      height: 50,
                      child: Placeholder(),
                    ),
                  ]),
                ),
        
                const Text(
                  'view more...',
                ),
                const Text(
                  'Pump Control',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Placeholder(
                  fallbackHeight: 150,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
