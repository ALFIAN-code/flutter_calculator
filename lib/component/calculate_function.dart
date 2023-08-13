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
}
