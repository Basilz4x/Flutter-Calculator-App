import 'package:calculator_app/ui/pages/home_page_controller.dart';
import 'package:calculator_app/util/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/util/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonContainer extends ConsumerWidget {
  const ButtonContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context, ref) {
    final isButtonDisabled = !ref.watch(calculatorProvider).enabledButton;
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(6),
      height: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: isButtonDisabled && text != "AC"
                  ? AppColors.secondaryColor
                  : AppColors.mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: isButtonDisabled && text != "AC"
              ? null
              : () {
                  Utils.getAction(text, ref);
                },
          child: text == "<"
              ? Icon(
                  Icons.backspace_outlined,
                  color: Utils.getColors(text),
                  size: 30,
                )
              : text == "*"
                  ? Icon(
                      Icons.close,
                      color: Utils.getColors(text),
                      size: 30,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                          color: Utils.getColors(text),
                          fontSize: Utils.isOperator(text)
                              ? 30
                              : text == "Ans"
                                  ? 19
                                  : 22),
                    )),
    ));
  }
}
