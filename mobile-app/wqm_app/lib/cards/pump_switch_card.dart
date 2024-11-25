import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wqm_app/state_manager.dart';

class PumpSwitchCard extends StatefulWidget {
  const PumpSwitchCard({super.key});

  @override
  State<PumpSwitchCard> createState() => _PumpSwitchCardState();
}

class _PumpSwitchCardState extends State<PumpSwitchCard> {
  bool isOn = false;

  void switchState() {
    setState(() {
      isOn = !isOn;
    });
  }

  void pickColor(String mode) {
    if (mode == 'Manual') {
      if (isOn == true) {
        Provider.of<PumpSwitchProvider>(context, listen: false).changeHandler(
            newColor: Color.fromRGBO(7, 250, 27, 1), newMode: 'Running');
      } else {
        Provider.of<PumpSwitchProvider>(context, listen: false).changeHandler(
            newColor: Color.fromRGBO(247, 46, 46, 1), newMode: 'Stopped');
      }
    }
  }

  // Resets the state in Auto mode
  void reset() async {
    await FirebaseFirestore.instance
        .collection('pumpControl') // Replace with your collection name
        .doc('fCgyfcht2wPkn1TJ05KE') // Replace with your document ID
        .update({'switch': false});
    setState(() {
      isOn = false;
    });
  }

  // Toggles the pump's state and updates Firestore
  Future<void> updateFirestore() async {
    // Update Firestore with the new state
    try {
      await FirebaseFirestore.instance
          .collection('pumpControl') // Replace with your collection name
          .doc('fCgyfcht2wPkn1TJ05KE') // Replace with your document ID
          .update({'switch': isOn ? true : false});
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update database.')),
        );
      }
      //more on this
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic providerMode = context.watch<PumpModeProvider>().modeState;

    // Reset if mode changes to Auto and pump is ON
    if (providerMode == 'Auto' && isOn) {
      reset();
    }

    return SizedBox(
      height: 170,
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
              const SizedBox(height: 10),
              Text(
                'Status: ${isOn ? 'ON' : 'OFF'}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: isOn,
                    onChanged: providerMode == 'Auto'
                        ? (context) => reset() // Disable switch in Auto mode
                        : (context) {
                            switchState();
                            pickColor(providerMode);
                            updateFirestore();
                          },
                    inactiveThumbColor: providerMode == 'Manual'
                        ? const Color.fromRGBO(247, 46, 46, 1) // Red
                        : null,
                    activeTrackColor: providerMode == 'Manual'
                        ? const Color.fromRGBO(7, 250, 27, 1) // Green
                        : null,
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

//old implementation
// class PumpSwitchCard extends StatefulWidget {
//   const PumpSwitchCard({super.key});

//   @override
//   State<PumpSwitchCard> createState() => _PumpSwitchCardState();
// }

// class _PumpSwitchCardState extends State<PumpSwitchCard> {
//   bool isOn = false;

//   void switchState() {
//     setState(() {
//       isOn = !isOn;
//     });
//   }

//   void pickColor(String mode) {
//     if (mode == 'Manual') {
//       if (isOn == true) {
//         Provider.of<PumpSwitchProvider>(context, listen: false).changeHandler(
//             newColor: Color.fromRGBO(7, 250, 27, 1), newMode: 'Running');
//       } else {
//         Provider.of<PumpSwitchProvider>(context, listen: false).changeHandler(
//             newColor: Color.fromRGBO(247, 46, 46, 1), newMode: 'Stopped');
//       }
//     }
//   }

//   void reset() {
//     setState(() {
//       isOn = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     dynamic providerMode = context.watch<PumpModeProvider>().modeState;

//     if (providerMode == 'Auto' && isOn) {
//       reset();
//     }

//     return SizedBox(
//       height: 170,
//       width: double.infinity,
//       child: Card(
//         shadowColor: Theme.of(context).colorScheme.primary,
//         elevation: 3.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Pump Switch',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Status: ${isOn ? 'ON' : 'OFF'}',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Switch(
//                     value: isOn,
//                     onChanged: providerMode == 'Auto'
//                         ? (context) => reset()
//                         : (context) {
//                             switchState();
//                             pickColor(providerMode);
//                           },
//                     inactiveThumbColor: providerMode == 'Manual'
//                         ? Color.fromRGBO(247, 46, 46, 1)
//                         : null,
//                     activeTrackColor: providerMode == 'Manual'
//                         ? Color.fromRGBO(7, 250, 27, 1)
//                         : null,
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // Card => End
