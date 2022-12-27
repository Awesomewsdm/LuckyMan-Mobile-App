import 'package:flutter/material.dart';

import '../../../Components/text_styling.dart';
import '../../constants/image_strings.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.size, required this.title, required this.subtitle,
  }) : super(key: key);

  final Size size;
  final String title;
  final String subtitle;

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
         BlackTextWidget(
          text: title,
          fontSize: 30.0,
        ),
         Text(subtitle),
      ],
    );
  }
}
