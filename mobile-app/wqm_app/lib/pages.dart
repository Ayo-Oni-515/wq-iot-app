import 'package:flutter/material.dart';

//Pages => Start
class WaterParameterListPage extends StatelessWidget {
  const WaterParameterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      'assets/icons/ph_icon.png',
      'assets/icons/temperature_icon.png',
      'assets/icons/turbidity_icon.png',
      'assets/icons/tds_icon.png',
      'assets/icons/ec_icon.png'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Parameters',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            itemCount: icons.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 15.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return UnderConstruction();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromRGBO(227, 242, 253, 1),
                  ),
                  // Different color shades
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(icons[index]),
                      ),
                      Text(
                        'pH',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        '7.1',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class PumpControlPage extends StatelessWidget {
  const PumpControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4.0,
                shadowColor: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Icon(
                        Icons.build,
                        size: 50,
                      ),
                      Text('Pump Control'),
                      Text('This page is still under construction'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//To be implemented in later updates
// class CustomLineChartPage extends StatelessWidget {
//   final String chartTitle;
//   const CustomLineChartPage({super.key, required this.chartTitle});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           chartTitle,
//           maxLines: 2,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ),
//       body: Expanded(child: CustomLineChart()),
//     );
//   }
// }

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
              Text('This page is still under construction'),
            ],
          ),
        ),
      ),
    );
  }
}
// Pages => End