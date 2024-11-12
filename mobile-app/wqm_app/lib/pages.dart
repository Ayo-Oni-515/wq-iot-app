import 'package:flutter/material.dart';
import 'package:wqm_app/cards.dart';
import 'package:wqm_app/charts.dart';

//Pages => Start
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
    );
  }
}

class ParameterListPageModel {
  final String parameter;
  final double parameterValue;
  final String displayIcon;
  final String unit;

  ParameterListPageModel({
    required this.parameter,
    required this.parameterValue,
    this.displayIcon = 'assets/icons/default_icon.png',
    this.unit = '',
  });
}

class ParameterListData {
  final List<ParameterListPageModel> parameterData = [
    ParameterListPageModel(
        parameter: 'pH',
        parameterValue: 7.1, //Add raspi-value
        displayIcon: 'assets/icons/ph_icon.png',
        unit: ''),
    ParameterListPageModel(
        parameter: 'Temperature',
        parameterValue: 25, //Add raspi-value
        displayIcon: 'assets/icons/temperature_icon.png',
        unit: '°C'),
    ParameterListPageModel(
        parameter: 'Turbidity',
        parameterValue: 20, //Add raspi-value
        displayIcon: 'assets/icons/turbidity_icon.png',
        unit: 'NTU'),
    ParameterListPageModel(
        parameter: 'Total Dissolved Solids',
        parameterValue: 500, //Add raspi-value
        displayIcon: 'assets/icons/tds_icon.png',
        unit: 'ppm'),
    ParameterListPageModel(
        parameter: 'Electrical Conductivity',
        parameterValue: 1000, //Add raspi-value
        displayIcon: 'assets/icons/ec_icon.png',
        unit: 'µS/cm'),
    ParameterListPageModel(
        parameter: 'Hardness',
        parameterValue: 100, //Add raspi-value
        displayIcon: 'assets/icons/default_icon.png',
        unit: 'ppm'),
    ParameterListPageModel(
        parameter: 'Salinity',
        parameterValue: 300, //Add raspi-value
        displayIcon: 'assets/icons/default_icon.png',
        unit: 'ppt'),
    ParameterListPageModel(
        parameter: 'Dissolved Oxygen',
        parameterValue: 100, //Add raspi-value
        displayIcon: 'assets/icons/default_icon.png',
        unit: 'mg/L'),
  ];
}

class ParameterListPage extends StatelessWidget {
  const ParameterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ParameterListData();

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
            itemCount: data.parameterData.length,
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
                    return CustomLineChartPage(
                        chartTitle: data.parameterData[index].parameter);
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
                        backgroundImage:
                            AssetImage(data.parameterData[index].displayIcon),
                      ),
                      Text(
                        data.parameterData[index].parameter,
                        // maxLines: ,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${data.parameterData[index].parameterValue} ${data.parameterData[index].unit}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                MainCard(
                  cardTitle: 'Water Level',
                  chartType: RadialProgressBar(level: 50.0), //Add raspi_value
                ),
                SizedBox(
                  height: 10,
                ),
                PumpActivityCard(),
                SizedBox(
                  height: 10,
                ),
                PumpControlModeCard(),
                SizedBox(
                  height: 10,
                ),
                PumpSwitchCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLineChartPage extends StatelessWidget {
  final String chartTitle;
  const CustomLineChartPage({super.key, required this.chartTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$chartTitle Overview',
          maxLines: 2,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 600,
              child: LinearChart(
                chartHeader: chartTitle,
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

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
// Pages => End
