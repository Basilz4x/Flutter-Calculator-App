class Calculator {
  Calculator(
      {this.result = "0",
      this.equation = "0",
      this.enabledButton = true,
      this.oldResult = "0"});
  final String result;
  final String equation;
  final bool enabledButton;
  final String oldResult;

  Calculator copyWith(
      {String? result,
      String? equation,
      bool? enabledButton,
      String? oldResult}) {
    return Calculator(
      result: result ?? this.result,
      equation: equation ?? this.equation,
      enabledButton: enabledButton ?? this.enabledButton,
      oldResult: oldResult ?? this.oldResult,
    );
  }
}
