import 'package:flutter/material.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';

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
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 1),
                blurRadius: 2.0,
                spreadRadius: 0.0,
              )
            ],
            shape: BoxShape.rectangle,
            color: boxColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 3.0,
        ),
        BlackTextWidget(text: iconLabel),
      ],
    );
  }
}
