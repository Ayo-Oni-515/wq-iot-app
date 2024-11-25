import 'package:flutter/material.dart';

class NotificationsCentrePage extends StatefulWidget {
  const NotificationsCentrePage({super.key});

  @override
  State<NotificationsCentrePage> createState() =>
      _NotificationsCentrePageState();
}

class _NotificationsCentrePageState extends State<NotificationsCentrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
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
