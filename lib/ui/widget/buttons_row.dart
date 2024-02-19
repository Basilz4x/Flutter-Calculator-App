import 'package:calculator_app/ui/widget/button_container.dart';
import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key, required this.buttonList});
  final List<String> buttonList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: buttonList
            .map((buttonText) => ButtonContainer(
                  text: buttonText,
                ))
            .toList(),
      ),
    );
  }
}
