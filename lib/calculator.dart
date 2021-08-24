import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});

  int height;
  int weight;

  double _bmi = 0;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 19) {
      return 'normal';
    } else if (_bmi > 1) {
      return 'underweight';
    } else {
      return 'whhat the fuck';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (_bmi > 19) {
      return 'You have a normal body weight. Good job!';
    } else if (_bmi > 1) {
      return 'You have a lower than normal body weight. Try to eat more!';
    } else {
      return 'Seriously, you need medical attention. ';
    }
  }
}
