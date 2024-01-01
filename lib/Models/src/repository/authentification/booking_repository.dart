import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/booking_history_model.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/bus_model.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_selection_model.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/user_booking_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

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
            snackPosition: SnackPosition.BOTTOM,
            'You\'ve successfully booked your seats',
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

  final auth = FirebaseAuth.instance;

  Future<List<BookingHistoryData>> getUserBookingHistory() async {
    final userID = auth.currentUser!.uid;

    final snapshot = await _db
        .collection("Users")
        .doc(userID)
        .collection("Booking Info")
        .get();

    final userBookingData =
        snapshot.docs.map((e) => BookingHistoryData.fromSnaphot(e)).toList();
    return userBookingData;
  }

  Future<void> updateBookedSeatsList(String busDocRefID,
      List<dynamic> userSelectedSeats, String passengers) async {
    await _db
        .collection("Buses")
        .doc(busDocRefID)
        .update({
          'bookedSeats': FieldValue.arrayUnion(userSelectedSeats),
          "passengers": FieldValue.arrayUnion([passengers])
        })
        .whenComplete(
          () => Get.snackbar(
            "Success, Seats Added",
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
            'Sorry, something went wrong, seats not added',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.red,
            backgroundColor: Colors.blue.withOpacity(0.7),
          );
        });
  }

  Future<List<BusModel>> getAllRequestedBuses(
      String destination, String origin, String departureDate) async {
    final snapshot = await _db
        .collection("Buses")
        .where("destination", isEqualTo: destination)
        .where("origin", isEqualTo: origin)
        .where("departureDate", isEqualTo: departureDate)
        .get();
    final allRequestedBuses =
        snapshot.docs.map((doc) => BusModel.fromMap(doc.data())).toList();
    return allRequestedBuses;
  }
}
