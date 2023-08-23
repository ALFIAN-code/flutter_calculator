import 'package:math_expressions/math_expressions.dart';

class CalculateFunction {
  var userQuestion = '';

  var result = '';

  void clearButton() {
    userQuestion = '';
    result = '';
  }

  void addToUserQuestion(String digit) {
    userQuestion += digit;
  }

  void equalFunction() {
    try {
      String finalQuestion = userQuestion;
      finalQuestion = finalQuestion.replaceAll('x', '*');
      finalQuestion = finalQuestion.replaceAll('÷', '/');

      Parser _parser = Parser();
      Expression exp = _parser.parse(finalQuestion);
      ContextModel cm = ContextModel();
      double evaluate = exp.evaluate(EvaluationType.REAL, cm);

      result = evaluate.toString();
    } catch (e) {
      print(e);
    }
  }
}
