import 'package:flutter/material.dart';

class SignInRedirect extends StatelessWidget {
  const SignInRedirect({
    Key? key,
    required this.text,
    required this.onTap,
    required this.redirectText,
  }) : super(key: key);
  final String text;
  final void Function() onTap;
  final String redirectText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Text(text),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              redirectText,
              style: const TextStyle(color: Colors.blue, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
