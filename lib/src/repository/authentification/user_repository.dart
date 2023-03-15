import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_selection_model.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/user_booking_model.dart';
import '../../features/authentification/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  RxString userDocRef = ''.obs;

  createUser(UserModel user, String userDocRef) async {
    await _db
        .collection('Users')
        .doc(userDocRef)
        .set(
          user.toJson(),
        )
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
    // print(object);
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

  Future<void> addBooking(
      UserBookingModel userBookingModel, String userDocRef) async {
    await _db
        .collection("Users")
        .doc(userDocRef).collection("Booking Info").doc(userDocRef)
        .set(userBookingModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            'Booking information recieved',
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

   Future<void> updateUserBookingDetails(
      UserBookingModel userBookingModel, String userDocRef) async {
    await _db
        .collection("Users")
        .doc(userDocRef)
        .update(userBookingModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            '',
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

   Future<void> updateUserSeatSelectionDetails(
      SeatSelectionModel seatSelectionModel, String userDocRef) async {
    await _db
        .collection("Users")
        .doc(userDocRef)
        .update(seatSelectionModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            '',
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

  Future<void> addBookedSeat(
      SeatSelectionModel seatSelectionModel, String userDocRef) async {
    await _db
        .collection("Users")
        .doc(userDocRef).collection("Booking Info").doc(userDocRef)
        .update(seatSelectionModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            'Selected seats added',
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
}
