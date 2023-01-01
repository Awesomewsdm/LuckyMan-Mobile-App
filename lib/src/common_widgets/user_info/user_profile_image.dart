import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    Key? key, this.width = 80.0, this.height = 80.0,
  }) : super(key: key);
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20.0),
        image: const DecorationImage(
            image: AssetImage(manWithGuitar), fit: BoxFit.fill),
        border: Border.all(
          width: 5,
          color: Colors.white,
        ),
      ),
    );
  }
}
