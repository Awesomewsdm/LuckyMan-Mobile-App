import 'package:angie_notebook/src/common_widgets/bottom_nav/bottom_nav.dart';
import 'package:angie_notebook/src/repository/authentification/authentification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signInUser(String email, String password) async {
    await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
    Get.to(
      () => const BottomNav(),
    );
  }
}
