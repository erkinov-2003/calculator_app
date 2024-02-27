import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_expressions/math_expressions.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeSuccessState(countNumber: '', answerNumber: ''));

  String _countNumber = "";
  String _answerNumber = "";
  bool isSelected = true;

  void changeSelectedCard() {
    isSelected = !isSelected;
    emit(HomeSuccessState(countNumber: '', answerNumber: ''));
  }

  String get countNumber => _countNumber;
  String get answerNumber => _answerNumber;

  void addToExpression(String value) {
    _countNumber += value;
    emit(HomeSuccessState(
        countNumber: _countNumber, answerNumber: _answerNumber));
  }

  void removeLast() {
    _countNumber = _countNumber.substring(0, _countNumber.length - 1);
    emit(HomeSuccessState(
        countNumber: _countNumber, answerNumber: _answerNumber));
  }

  void clear() {
    _countNumber = "";
    _answerNumber = "";
    emit(HomeSuccessState(
        countNumber: _countNumber, answerNumber: _answerNumber));
  }

  void equalToFunction() {
      try {
      var question = _countNumber.replaceAll("x", "*");
      Parser prs = Parser();
      Expression expression = prs.parse(question);
      ContextModel contextModel = ContextModel();
      double numbers = expression.evaluate(EvaluationType.REAL, contextModel);
      _answerNumber = numbers.toStringAsFixed(2);
    } catch (e) {
      _answerNumber = "Notogri son kiritildi";
    }
    emit(HomeSuccessState(
        countNumber: _countNumber, answerNumber: _answerNumber));
  }
}
