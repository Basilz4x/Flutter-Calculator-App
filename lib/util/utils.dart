import 'package:calculator_app/ui/pages/home_page_controller.dart';
import 'package:calculator_app/util/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

class Utils {
  static bool isOperator(String text) {
    return ['+', '-', '*', '/', '=', '%'].contains(text);
  }

  static Color getColors(String text) {
    switch (text) {
      case "+":
      case "-":
      case "*":
      case "/":
      case "=":
      case "%":
        return AppColors.operatorColor;
      case "AC":
      case "<":
        return AppColors.removeColor;
      default:
        return AppColors.textColor;
    }
  }

  static getAction(String text, WidgetRef ref) {
    switch (text) {
      case "AC":
        return ref.read(calculatorProvider.notifier).clear();
      case "<":
        return ref.read(calculatorProvider.notifier).remove();
      case "=":
        return ref.read(calculatorProvider.notifier).evaluate();
      case "Ans":
        return ref.read(calculatorProvider.notifier).oldResult();
      default:
        return ref.read(calculatorProvider.notifier).append(text);
    }
  }

  static String evaluateExpression(String expression) {
    try {
      Expression exp = Parser().parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      // Check if the result has a decimal part
      if (result % 1 == 0) {
        // If the decimal part is .0, convert to int
        return result.toInt().toString();
      } else {
        // Otherwise, keep it as a double without the decimal part
        return result.toString();
      }
    } catch (e) {
      return 'Error';
    }
  }
}
