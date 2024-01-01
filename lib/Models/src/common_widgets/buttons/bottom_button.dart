import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onPressed,
    required this.bottomTextLabel,
    this.loadingIcon,
    this.height,
     this.icon,
  }) : super(key: key);

  final void Function() onPressed;
  final String bottomTextLabel;
  final Widget? loadingIcon;
  final double? height;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlue,
        ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
