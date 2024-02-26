import 'package:math_expressions/math_expressions.dart';

class CalculatorService {
  List<String> get getList => _buttonText;

  bool switchButtonColor(String x) {
    if (x == "÷" || x == "x" || x == "+" || x == "-" || x == "=") {
      return true;
    } else {
      return false;
    }
  }



  final List<String> _buttonText = [
    'C',
    'DEl',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];
}