import 'package:flutter/material.dart';

class WQMProvider extends ChangeNotifier {
  //Entire App data.
  final List wqmData = [];
}

class PumpModeProvider extends ChangeNotifier {
  Color modeColor;
  String modeState;

  PumpModeProvider(
      {this.modeColor = const Color.fromRGBO(38, 155, 255, 1),
      this.modeState = 'Auto'});

  void changeHandler({required Color newColor, required String newMode}) {
    modeColor = newColor;
    modeState = newMode;
    notifyListeners();
  }
}

class PumpSwitchProvider extends ChangeNotifier {
  Color statusColor;
  String statusState;

  PumpSwitchProvider({
    this.statusColor = const Color.fromRGBO(38, 155, 255, 1),
    this.statusState = 'Raspi-Override',
  });

  void changeHandler({required Color newColor, required String newMode}) {
    statusColor = newColor;
    statusState = newMode;
    notifyListeners();
  }
}
