import 'package:calculator_app/ui/widget/buttons_row.dart';
import 'package:calculator_app/util/constant/colors.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32))),
      padding: const EdgeInsets.all(18),
      child: const Column(children: [
        ButtonsRow(buttonList: ["AC", "<", "%", "/"]),
        ButtonsRow(buttonList: ["7", "8", "9", "*"]),
        ButtonsRow(buttonList: ["4", "5", "6", "-"]),
        ButtonsRow(buttonList: ["1", "2", "3", "+"]),
        ButtonsRow(buttonList: ["0", ".", "Ans", "="]),
      ]),
    );
  }
}
