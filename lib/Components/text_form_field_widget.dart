import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    required this.prefixIcon,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        prefixIcon: prefixIcon,
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
