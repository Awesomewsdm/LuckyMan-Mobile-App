import 'package:angie_notebook/Components/text_styling.dart';
import 'package:flutter/material.dart';

class SeatStatus extends StatelessWidget {
  const SeatStatus({
    Key? key,
    required this.boxColor,
    required this.iconLabel,
    this.icon,
  }) : super(key: key);
  final Color boxColor;
  final String iconLabel;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: boxColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 8.0,
        ),
        BlackTextWidget(text: iconLabel),
      ],
    );
  }
}


