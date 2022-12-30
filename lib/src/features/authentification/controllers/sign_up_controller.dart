import 'package:angie_notebook/src/common_widgets/bottom_nav/bottom_nav.dart';
import 'package:angie_notebook/src/features/authentification/models/user_model.dart';
import 'package:angie_notebook/src/repository/authentification/authentification_repository.dart';
import 'package:angie_notebook/src/repository/authentification/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final studentID = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> registerUser(String email, String password) async {
  await  AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
//  Future<void> error
    // Get.showSnackbar(
    //   GetSnackBar(
    //     message: error.toString(),
    //   ),
    // );
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
   await registerUser(user.email, user.password);
    Get.to(() => const BottomNav());
  }
}