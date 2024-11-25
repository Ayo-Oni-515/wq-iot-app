import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wqm_app/state_manager.dart';

class PumpControlModeCard extends StatefulWidget {
  const PumpControlModeCard({super.key});

  @override
  State<PumpControlModeCard> createState() => _PumpControlModeState();
}

class _PumpControlModeState extends State<PumpControlModeCard> {
  String selectedMode = 'Auto';

  void pickColor() {
    // Update local state via providers
    if (selectedMode == 'Auto') {
      Provider.of<PumpModeProvider>(context, listen: false).changeHandler(
          newColor: const Color.fromRGBO(38, 155, 255, 1),
          newMode: selectedMode);
      Provider.of<PumpSwitchProvider>(context, listen: false).changeHandler(
          newColor: const Color.fromRGBO(38, 155, 255, 1),
          newMode: 'Raspi-Override');
    } else if (selectedMode == 'Manual') {
      Provider.of<PumpModeProvider>(context, listen: false).changeHandler(
          newColor: const Color.fromRGBO(255, 155, 2, 1),
          newMode: selectedMode);
    }
  }

  // Function to update Firestore and notify providers
  Future<void> updateFirestore() async {
    try {
      // Update Firestore with the selected mode
      await FirebaseFirestore.instance
          .collection('pumpControl')
          .doc("fCgyfcht2wPkn1TJ05KE") // Replace with your document ID
          .update({'mode': selectedMode});
    } catch (e) {
      // Handle Firestore update errors 
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating database.')),
        );
      }
      //more on this
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
              const SizedBox(height: 10),
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
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Pump Control Mode',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                                'Are you sure you want to change the pump\'s control mode?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    selectedMode = selection.first;
                                    pickColor(); // Update Providers
                                  });
                                  // Update Firestore
                                  updateFirestore();
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
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


//old implementation
// class PumpControlModeCard extends StatefulWidget {
//   const PumpControlModeCard({super.key});

//   @override
//   State<PumpControlModeCard> createState() => _PumpControlModeState();
// }

// class _PumpControlModeState extends State<PumpControlModeCard> {
//   String selectedMode = 'Auto';
//   void pickColor() {
//     if (selectedMode == 'Auto') {
//       Provider.of<PumpModeProvider>(context, listen: false).changeHandler(
//           newColor: Color.fromRGBO(38, 155, 255, 1), newMode: selectedMode);
//       Provider.of<PumpSwitchProvider>(context, listen: false).changeHandler(
//           newColor: Color.fromRGBO(38, 155, 255, 1), newMode: 'Raspi-Override');
//     } else if (selectedMode == 'Manual') {
//       Provider.of<PumpModeProvider>(context, listen: false).changeHandler(
//           newColor: Color.fromRGBO(255, 155, 2, 1), newMode: selectedMode);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 155,
//       width: double.infinity,
//       child: Card(
//         shadowColor: Theme.of(context).colorScheme.primary,
//         elevation: 3.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Control Mode',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SegmentedButton<String>(
//                     segments: const [
//                       ButtonSegment(value: 'Manual', label: Text('Manual')),
//                       ButtonSegment(value: 'Auto', label: Text('Auto')),
//                     ],
//                     selected: {selectedMode},
//                     onSelectionChanged: (Set<String> selection) {
//                       setState(() {
//                         showDialog(
//                             barrierDismissible: false,
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 title: Text('Pump Control Mode',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleMedium),
//                                 content: const Text(
//                                     'Are you sure you want to change the pump\'s control mode?'),
//                                 actions: [
//                                   TextButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text('No')),
//                                   TextButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                         setState(() {
//                                           selectedMode = selection.first;
//                                           pickColor();
//                                         });
//                                       },
//                                       child: Text('Yes'))
//                                 ],
//                               );
//                             });
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }