import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentification/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection('Users')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            'Your account has been created',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.blue[100],
            backgroundColor: Colors.blue.withOpacity(0.7),
          ),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        'Sorry, something went wrong',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        backgroundColor: Colors.blue.withOpacity(0.7),
      );
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnaphot(e)).single;

    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnaphot(e)).toList();

    return userData;
  }

  Future<void> addBooking(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}

// Future<void> addBooking(UserBookingModel userBookingModel) async {
//   await _db
//       .collection("Users")
//       .doc()
//       .update(userBookingModel.toJson())
//       .whenComplete(
//         () => Get.snackbar(
//           "Success",
//           'You\'ve successfully booked your seats',
//           snackPosition: SnackPosition.BOTTOM,
//           colorText: Colors.blue[100],
//           backgroundColor: Colors.blue.withOpacity(0.7),
//         ),
//       )
//       // ignore: body_might_complete_normally_catch_error
//       .catchError((error, stackTrace) {
//     Get.snackbar(
//       "Error",
//       'Sorry, something went wrong',
//       snackPosition: SnackPosition.BOTTOM,
//       colorText: Colors.red,
//       backgroundColor: Colors.blue.withOpacity(0.7),
//     );
//   });
// }
