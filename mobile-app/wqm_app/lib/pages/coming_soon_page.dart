import 'package:flutter/material.dart';

//Under construction widget
class UnderConstruction extends StatelessWidget {
  const UnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trends Page',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.build,
                size: 50,
              ),
              Text('Coming Soon!!!'),
            ],
          ),
        ),
      ),
    );
  }
}
