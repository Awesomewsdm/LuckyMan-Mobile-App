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
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          Color(0xFFFFCA28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 1.0),
        child: Text(
          bottomTextLabel,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.black87,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
// 0xFF448AFF