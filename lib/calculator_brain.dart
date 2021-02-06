
import 'dart:math';

class CalculatorBrain {

  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Do some exercices';
    } else if (_bmi >= 18.5) {
      return 'You are ok';
    } else {
      return 'Need to eat more';
    }
  }
}