import 'package:calculator_app/model/calculator.dart';
import 'package:calculator_app/util/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier() : super(Calculator());

  void append(String buttonText) {
    // If the equation is >= 20 it will not type
    if (state.equation.length >= 22) {
      return;
    }

    // Will return and do nothing if we try to append two operator
    if ((Utils.isOperator(state.equation[state.equation.length - 1])) &&
        Utils.isOperator(buttonText)) {
      return;
    }

    // Will return and do nothing if we try to append two dot(".")
    if (state.equation[state.equation.length - 1] == "." && buttonText == ".") {
      return;
    }

    // we remove the first 0 if the buttonText is not 0, and keep it if its zero
    final String tempEquation = state.equation;
    if (tempEquation.length == 1 && tempEquation == "0") {
      if (buttonText == "0") {
        state = state.copyWith(equation: tempEquation + buttonText);
        return;
      }

      state = state.copyWith(equation: buttonText);
      return;
    }
    state = state.copyWith(equation: tempEquation + buttonText);
  }

  void clear() {
    // Will reset the Calculator to its default values
    state = Calculator(oldResult: state.oldResult);
  }

  void remove() {
    if (state.equation != "" && state.equation != "0") {
      state = state.copyWith(
          equation: state.equation.substring(0, state.equation.length - 1));
      if (state.equation == "") {
        clear();
      }
    }
  }

  void oldResult() {
    if (state.equation.length == 1 && state.equation == "0") {
      state = state.copyWith(equation: state.oldResult);
      return;
    }
    state = state.copyWith(equation: state.equation + state.oldResult);
  }

  void evaluate() {
    final currentEquation = state.equation;

    // if last thing in the equation is an operator dont evalute and return;
    if (Utils.isOperator(currentEquation[currentEquation.length - 1])) {
      return;
    }
    String expression = "0";

    if (Utils.isOperator(currentEquation[0])) {
      final currentResult =
          state.result == "Cannot divide by zero" ? "0" : state.result;
      expression = currentResult + state.equation;
    } else {
      expression = state.equation;
    }

    final String answer = Utils.evaluateExpression(expression);

    state = state.copyWith(result: answer, equation: "0", oldResult: answer);
    if (state.result == "Infinity") {
      state = Calculator(result: "Cannot divide by zero", enabledButton: false);
    } else if (state.result == "Error") {
      state = Calculator(result: "An Error Occurred", enabledButton: false);
    }
  }
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculator>(
        (ref) => CalculatorNotifier());
