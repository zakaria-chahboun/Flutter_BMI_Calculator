import 'dart:math';

import 'package:flutter/widgets.dart';

class BmiCalculator {
  BmiCalculator({@required this.height,@required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String bmiCalculate() {
    this._bmi = weight / pow(height / 100, 2);
    return this._bmi.toStringAsFixed(1); // One degit ater coma
  }

  String getResult() {
    if (this._bmi >= 25.0) return "Overweight";
    if (this._bmi > 18.5) return "Normal";
    return "Underweight";
  }

  String getInterpretation() {
    if (this._bmi >= 25.0)
      return "You have a highter than normal body weight.\nTry to exercise more!";
    if (this._bmi > 18.5) return "You have a normal body weight.\nGood Job!";
    return "You have a lower than normal body weight.\nYou can eat a bit more!";
  }
}
