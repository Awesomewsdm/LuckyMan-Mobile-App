import 'package:flutter/material.dart';

class FormBody extends StatelessWidget {
  const FormBody({
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
