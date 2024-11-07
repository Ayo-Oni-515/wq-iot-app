import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wqm_app/charts.dart';
import 'package:wqm_app/pages.dart';
import 'package:wqm_app/state_manager.dart';

// Cards => Start
//Use Line chart for Overview
class MainCard extends StatefulWidget {
  final String cardTitle;
  final Widget chartType;

  const MainCard(
      {super.key,
      required this.cardTitle,
      this.chartType = const RadialGauge(level: 0)});

  @override
  State<MainCard> createState() => _WaterMainCardState();
}

class _WaterMainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CustomLineChartPage(
            chartTitle: widget.cardTitle,
          );
        }));
      },
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Card(
          shadowColor: Theme.of(context).colorScheme.primary,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.cardTitle,
                    style: TextStyle(
                        fontSize: 23,
                        // color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                    height: 219, child: widget.chartType), //Add raspi-vaule
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ParameterListCard extends StatelessWidget {
  final String parameter;
  final double parameterValue;
  final String displayIcon;
  final String unit;

  const ParameterListCard(
      {super.key,
      required this.parameter,
      required this.parameterValue,
      this.unit = '',
      this.displayIcon = 'assets/icons/default_icon.png'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          shadowColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(displayIcon),
                ),
                trailing: Text(
                  '${parameterValue.toString()} $unit',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                title: Text(parameter),
                subtitle: Row(children: [
                  Icon(Icons.arrow_drop_up), //Add raspi-value
                  Text('3.5%'), //Add raspi-value
                ]),
              )),
        ));
  }
}

class PumpActivityCard extends StatefulWidget {
  const PumpActivityCard({super.key});

  @override
  State<PumpActivityCard> createState() => _PumpActivityCardState();
}

class _PumpActivityCardState extends State<PumpActivityCard> {
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: Card(
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pump Activity',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _indicator('Status', Color.fromRGBO(247, 46, 46, 1),
                      'Stopped'), // or Stopped
                  _indicator(
                    'Mode',
                    context.watch<PumpModeProvider>().modeColor,
                    context.watch<PumpModeProvider>().modeState,
                  ) // or Manual
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicator(String label, Color color, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PumpControlModeCard extends StatefulWidget {
  const PumpControlModeCard({super.key});

  @override
  State<PumpControlModeCard> createState() => _PumpControlModeState();
}

class _PumpControlModeState extends State<PumpControlModeCard> {
  String selectedMode = 'Auto';
  String modeState = 'Auto';
  void pickColor() {
    if (modeState == 'Auto') {
      Provider.of<PumpModeProvider>(context, listen: false).changeHandler(
          newColor: Color.fromRGBO(38, 155, 255, 1), newMode: modeState);
    } else if (modeState == 'Manual') {
      Provider.of<PumpModeProvider>(context, listen: false).changeHandler(
          newColor: Color.fromRGBO(255, 155, 2, 1), newMode: modeState);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      width: double.infinity,
      child: Card(
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Control Mode',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'Manual', label: Text('Manual')),
                      ButtonSegment(value: 'Auto', label: Text('Auto')),
                    ],
                    selected: {selectedMode},
                    onSelectionChanged: (Set<String> selection) {
                      setState(() {
                        selectedMode = selection.first;
                        modeState = selectedMode;
                      });
                      pickColor();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PumpSwitchCard extends StatefulWidget {
  const PumpSwitchCard({super.key});

  @override
  State<PumpSwitchCard> createState() => _PumpSwitchCardState();
}

class _PumpSwitchCardState extends State<PumpSwitchCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pump Switch',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Card => End
