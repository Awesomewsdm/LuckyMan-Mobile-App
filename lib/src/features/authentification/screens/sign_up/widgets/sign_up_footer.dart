import 'package:flutter/material.dart';
import 'package:luckyman_app/src/constants/styles.dart';

class SignUpFormFooter extends StatelessWidget {
  const SignUpFormFooter({
    Key? key,
    required this.text,
    required this.onSignUpTap,
    required this.redirectText,
    this.onForgotPasswordTap,
  }) : super(key: key);
  final String text;
  final void Function() onSignUpTap;
  final String redirectText;
  final void Function()? onForgotPasswordTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
         
          const SizedBox(
            height: 20.0,
          ),
          Text(text),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: onSignUpTap,
            child: Text(
              redirectText,
              style: tFormTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
