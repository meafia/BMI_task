import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 18;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'Underweight';
    }
  }

  String getInteroretation() {
    if (_bmi >= 25) {
      return 'You have a higher body weight than normal';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower body weight than normal. Eat a bit more.';
    }
  }
}
