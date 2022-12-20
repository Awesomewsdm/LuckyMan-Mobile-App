import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onPressed,
    required this.bottomTextLabel,
  }) : super(key: key);

  final void Function() onPressed;
  final String bottomTextLabel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          Color.fromARGB(249, 255, 217, 46),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
        child: Text(
          bottomTextLabel,
          style: const TextStyle(
            fontSize: 22.0,
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
