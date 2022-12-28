import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentification/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createNewUser(UserModel user) async {
  await  _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            'Your account has been created',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.blue[100],
            backgroundColor: Colors.lightBlue.shade400.withOpacity(0.1),
          ),
        )
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        'Sorry, something went wrong',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        backgroundColor: Colors.lightBlue.shade400.withOpacity(0.1),
      );
      print(error.toString());
    });
  }
}
