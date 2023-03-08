import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

alert(String title, String subtitle) {
  return Get.defaultDialog(
    title: title,
    middleText: subtitle,
    backgroundColor: tLightBlue,
    titleStyle: const TextStyle(color: tWhiteColor),
    middleTextStyle: const TextStyle(color: tWhiteColor),
    radius: 10,
  );
}
