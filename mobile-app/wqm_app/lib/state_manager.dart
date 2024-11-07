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

  void changeHandler({required Color newColor, required String newMode}) async {
    modeColor = newColor;
    modeState = newMode;
    notifyListeners();
  }
}
