import 'package:flutter/material.dart';

class FormFieldWIdget extends StatelessWidget {
  const FormFieldWIdget({
    Key? key,
    required this.children,
  }) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: children));
  }
}
