import 'package:math_expressions/math_expressions.dart';

class CalculatorService {
  List<String> get getList => _buttonText;

  bool switchButtonColor(String x) {
    if (x == "÷" ||
        x == "x" ||
        x == "+" ||
        x == "-" ||
        x == "=" ||
        x == "/" ||
        x == "%") {
      return true;
    } else {
      return false;
    }
  }

  void equalToFunction(String countNumber, String answerNumber) {
    try {
      var question = countNumber;
      question = question.replaceAll("x", "*");
      Parser prs = Parser();
      Expression expression = prs.parse(question);
      ContextModel contextModel = ContextModel();
      double numbers = expression.evaluate(EvaluationType.REAL, contextModel);
      answerNumber = numbers.toInt().toString();
    } catch (e) {
      answerNumber = "Notogri son kiritildi";
    }
  }

  final List<String> _buttonText = [
    'ANS',
    'C',
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
    'DEL',
    '='
  ];
}
