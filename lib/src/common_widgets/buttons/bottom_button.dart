import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onPressed,
    required this.bottomTextLabel,
    this.loadingIcon,
    required this.height,
  }) : super(key: key);

  final void Function() onPressed;
  final String bottomTextLabel;
  final Widget? loadingIcon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.lightBlue,
        width: double.infinity,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                ),
                child: loadingIcon,
                ),
            Text(
              bottomTextLabel,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Icon(
              FontAwesomeIcons.arrowRightLong,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
