import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_selection_model.dart';
import 'package:luckyman_app/src/features/core/screens/seat_selection_screen.dart';
import 'package:luckyman_app/src/repository/authentification/user_repository.dart';

import '../../models/Booking_Models/user_booking_model.dart';

class BusBookingController extends GetxController {
  static BusBookingController get instance => Get.find();
  final _userRepo = Get.put(UserRepository());
  final _db = FirebaseFirestore.instance;

  final selectedDestination = ''.obs;
  final selectedBusType = ''.obs;
  final selectedDepatureTime = ''.obs;
  final selectedDepatureDate = ''.obs;
  final selectedPickupPoint = ''.obs;

  final agentName = TextEditingController();

  Future<void> addSeatListToDB(
      List<dynamic> seatList, String destination, String docRef) async {
    await _db
        .collection("Booking Data")
        .doc(docRef)
        .update({
          destination: FieldValue.arrayUnion(seatList),
        })
        .whenComplete(
          () => Get.snackbar(
            "Success",
            'Seat Added',
            snackPosition: SnackPosition.BOTTOM,
            colorText: const Color.fromARGB(255, 15, 32, 46),
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

  Future<DocumentSnapshot<Map<String, dynamic>>> getSeatList(
      String docID) async {
    final snapshot = await _db.collection("Booking Data").doc(docID).get();

    return snapshot;
    // ...
  }

  addBusBookingInfo(
      UserBookingModel userBookingModel, String userDocRef) async {
    await _userRepo.addBooking(userBookingModel, userDocRef);
    Get.to(
      () => SeatSelectionScreen(
        selectedDestination: selectedDestination.value,
      ),
    );
  }

  updateUserBookingData(
      UserBookingModel userBookingModel, String userDocRef) async {
    await _userRepo.updateUserBookingDetails(userBookingModel, userDocRef);
  }

  updateUserSeatSelectionData(
      SeatSelectionModel seatSelectionModel, String userDocRef) async {
    await _userRepo.updateUserSeatSelectionDetails(
        seatSelectionModel, userDocRef);
  }

  addSeatSelectionInfo(
      SeatSelectionModel seatSelectionModel, String userDocRef) async {
    await _userRepo.addBookedSeat(seatSelectionModel, userDocRef);
  }
}
