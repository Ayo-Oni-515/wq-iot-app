import 'package:flutter/material.dart';


// // import 'package:wqm_app/home.dart';
// import 'package:wqm_app/sandbox.dart';

// void main() {
//   runApp(const MaterialApp(home: Sandbox()));
// }

// import 'package:flutter/material.dart';

void main() {
  runApp(const WaterQualityApp());
}

class WaterQualityApp extends StatelessWidget {
  const WaterQualityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Quality Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPumpOn = false;
  final Map<String, double> waterParameters = {
    'pH': 7.0,
    'Temperature': 25.0,
    'TDS': 150.0,
    'Turbidity': 5.0,
  };

  void togglePump() {
    setState(() {
      isPumpOn = !isPumpOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Quality Monitor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Water Quality Parameters',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: waterParameters.entries.map((entry) {
                  return ParameterCard(
                    parameter: entry.key,
                    value: entry.value,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            PumpControlCard(
              isOn: isPumpOn,
              onToggle: togglePump,
            ),
          ],
        ),
      ),
    );
  }
}

class ParameterCard extends StatelessWidget {
  final String parameter;
  final double value;

  const ParameterCard({
    super.key,
    required this.parameter,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              parameter,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              value.toStringAsFixed(1),
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class PumpControlCard extends StatelessWidget {
  final bool isOn;
  final VoidCallback onToggle;

  const PumpControlCard({
    super.key,
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Pump Control',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status: ${isOn ? 'ON' : 'OFF'}',
                  style: const TextStyle(fontSize: 18),
                ),
                Switch(
                  value: isOn,
                  onChanged: (_) => onToggle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
