import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.labelText,
    required this.widget,
    this.enabledBorderColor,
    this.focusedBorderColor, this.controller,
  }) : super(key: key);
  final InputBorder? enabledBorderColor;
  final InputBorder? focusedBorderColor;
  final String labelText;
  final Widget widget;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        labelText: labelText,
        icon: widget,
        enabledBorder: enabledBorderColor,
        focusedBorder: focusedBorderColor,
      ),
    );
  }
}
