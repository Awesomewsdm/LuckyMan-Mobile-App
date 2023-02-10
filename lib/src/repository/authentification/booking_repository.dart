import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:luckyman_app/Models/seat_selection_model.dart';
import 'package:luckyman_app/Models/user_booking_model.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';

class BookingRepository extends GetxController {
  static BookingRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  addBooking(UserBookingModel userBookingModel) async {
    await _db
        .collection("Users")
        .doc()
        .update(userBookingModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            'You\'ve successfully booked your seats',
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

  addSeatSelectionInfo(
      SeatSelectionModel seatSelectionModel, UserModel user) async {
    await _db
        .collection('Users')
        .doc(user.id)
        .update(seatSelectionModel.toMap());
  }
}
