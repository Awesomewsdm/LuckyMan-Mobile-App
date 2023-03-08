import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';
import 'package:luckyman_app/src/repository/authentification/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final AuthenticationRepository authenticationRepository = Get.put(
    AuthenticationRepository(),
  );
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final studentID = TextEditingController();

  RxBool passwordVisible = true.obs;
  RxBool showSpinner = false.obs;

  final userRepo = Get.put(UserRepository());

  Future<void> registerUser(String? email, String? password) async {
    await authenticationRepository.createUserWithEmailAndPassword(
        email!, password!);
  }

  Future<void> createUser(UserModel user, String userDocRef) async {
    await userRepo.createUser(user, userDocRef);
    Get.to(() => const Home());
  }
}
