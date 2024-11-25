import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wqm_app/pages/custom_line_chart_page.dart';

class ParameterListPageModel {
  final String parameter;
  final double? parameterValue;
  final String displayIcon;
  final String unit;

  ParameterListPageModel({
    required this.parameter,
    this.parameterValue = 0,
    this.displayIcon = 'assets/icons/default_icon.png',
    this.unit = '',
  });
}

// class ParameterListData {
//   final double raspiPH;
//   final double raspiTemperature;
//   final double raspiTurbidity;
//   final double raspiTDS;
//   final double raspiEC;
//   final double raspiHardness;
//   final double raspiSalinity;
//   final double raspiDO;

//   ParameterListData({
//     required this.raspiPH,
//     required this.raspiTemperature,
//     required this.raspiTurbidity,
//     required this.raspiTDS,
//     required this.raspiEC,
//     required this.raspiHardness,
//     required this.raspiSalinity,
//     required this.raspiDO,
//     });
// }

class ParameterListPage extends StatelessWidget {
  const ParameterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("waterParameters").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Raspi Synchronization Failed.'));
        }
        final waterData = snapshot.data!;
        final waterParameters = waterData.docs[0].data();
        final String raspiPH = waterParameters['ph'].toString();
        final String raspiTemperature =
            waterParameters['temperature'].toString();
        final String raspiTurbidity = waterParameters['turbidity'].toString();
        final String raspiTDS = waterParameters['tds'].toString();
        final String raspiEC = waterParameters['ec'].toString();
        final String raspiHardness = waterParameters['hardness'].toString();
        final String raspiSalinity = waterParameters['salinity'].toString();
        final String raspiDO = waterParameters['do'].toString();

        final List<ParameterListPageModel> parameterData = [
          ParameterListPageModel(
              parameter: 'pH',
              parameterValue: double.parse(raspiPH), //Add raspi-value
              displayIcon: 'assets/icons/ph_icon.png',
              unit: ''),
          ParameterListPageModel(
              parameter: 'Temperature',
              parameterValue: double.parse(raspiTemperature), //Add raspi-value
              displayIcon: 'assets/icons/temperature_icon.png',
              unit: '°C'),
          ParameterListPageModel(
              parameter: 'Turbidity',
              parameterValue: double.parse(raspiTurbidity), //Add raspi-value
              displayIcon: 'assets/icons/turbidity_icon.png',
              unit: 'NTU'),
          ParameterListPageModel(
              parameter: 'Total Dissolved Solids',
              parameterValue: double.parse(raspiTDS), //Add raspi-value
              displayIcon: 'assets/icons/tds_icon.png',
              unit: 'ppm'),
          ParameterListPageModel(
              parameter: 'Electrical Conductivity',
              parameterValue: double.parse(raspiEC), //Add raspi-value
              displayIcon: 'assets/icons/ec_icon.png',
              unit: 'µS/cm'),
          ParameterListPageModel(
              parameter: 'Hardness',
              parameterValue: double.parse(raspiHardness), //Add raspi-value
              displayIcon: 'assets/icons/default_icon.png',
              unit: 'ppm'),
          ParameterListPageModel(
              parameter: 'Salinity',
              parameterValue: double.parse(raspiSalinity), //Add raspi-value
              displayIcon: 'assets/icons/default_icon.png',
              unit: 'ppt'),
          ParameterListPageModel(
              parameter: 'Dissolved Oxygen',
              parameterValue: double.parse(raspiDO), //Add raspi-value
              displayIcon: 'assets/icons/default_icon.png',
              unit: 'mg/L'),
        ];

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Parameters',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: GridView.builder(
                itemCount: parameterData.length,
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
                            chartTitle: parameterData[index].parameter);
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
                                AssetImage(parameterData[index].displayIcon),
                          ),
                          Text(
                            parameterData[index].parameter,
                            // maxLines: ,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${parameterData[index].parameterValue} ${parameterData[index].unit}',
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
      },
    );
  }
}
