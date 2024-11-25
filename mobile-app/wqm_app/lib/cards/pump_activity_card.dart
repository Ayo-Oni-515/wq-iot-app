
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wqm_app/state_manager.dart';

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
                  _indicator(
                      'Control Status',
                      context.watch<PumpSwitchProvider>().statusColor,
                      context.watch<PumpSwitchProvider>().statusState),
                  _indicator(
                    'Mode',
                    context.watch<PumpModeProvider>().modeColor,
                    context.watch<PumpModeProvider>().modeState,
                  )
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
