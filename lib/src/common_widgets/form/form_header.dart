
import 'package:flutter/material.dart';

import '../../../Components/text_styling.dart';
import '../../constants/image_strings.dart';
import '../../constants/text.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image(
            image: const AssetImage(
              tLogo,
            ),
            height: size.height * 0.25,
          ),
        ),
        const BlackTextWidget(
          text: tSignUpTitle,
          fontSize: 30.0,
        ),
        const Text(tSignUpSubTitle),
      ],
    );
  }
}