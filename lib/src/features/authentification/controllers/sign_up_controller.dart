import 'package:angie_notebook/src/features/authentification/models/user_model.dart';
import 'package:angie_notebook/src/repository/authentification/authentification_repository.dart';
import 'package:angie_notebook/src/repository/authentification/user_repository.dart';
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

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> creatUser(UserModel user) async {
  await  userRepo.createNewUser(user);
  }
}
