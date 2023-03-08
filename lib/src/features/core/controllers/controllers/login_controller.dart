import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final AuthenticationRepository authenticationRepository = Get.put(
    AuthenticationRepository(),
  );

  RxBool passwordVisible = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signInUser(String email, String password) async {
    await authenticationRepository
        .loginUserWithEmailAndPassword(email, password);
  }

  Future<void> sendUserPasswordReset(String? email,) async {
    await authenticationRepository.resetUserPassword(
        email!,);
  }
}
