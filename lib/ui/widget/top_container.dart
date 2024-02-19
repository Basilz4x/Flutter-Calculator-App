import 'package:calculator_app/ui/pages/home_page_controller.dart';
import 'package:calculator_app/util/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopContainer extends ConsumerWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final calculatorTop = ref.watch(calculatorProvider);
    return Container(
      padding: const EdgeInsets.all(22),
      color: AppColors.mainColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              calculatorTop.equation,
              style: const TextStyle(color: AppColors.textColor, fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(calculatorTop.result,
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 24,
              )),
        ],
      ),
    );
  }
}
