import 'package:calculator_app/ui/widget/bottom_container.dart';
import 'package:calculator_app/ui/widget/top_container.dart';
import 'package:calculator_app/util/constant/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 23, color: AppColors.textColor),
        ),
      ),
      body: const Column(
        children: [
          Expanded(child: TopContainer()),
          Expanded(flex: 2, child: BottomContainer())
        ],
      ),
    );
  }
}
