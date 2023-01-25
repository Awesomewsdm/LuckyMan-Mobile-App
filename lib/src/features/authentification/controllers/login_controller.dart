
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  RxBool passwordVisible = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signInUser(String email, String password) async {
    await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }
}
