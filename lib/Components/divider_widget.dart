

import 'package:flutter/material.dart';
import 'package:luckyman_app/Components/text_styling.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        const Expanded(
          
          child: Divider(
            // indent: 20.0,
            endIndent: 20.0,
            thickness: 1.0,
          ),
        ),
        AshTextWidget(text: title),
        const Expanded(
          child: Divider(
            indent: 20.0,
            // endIndent: 10.0,
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}