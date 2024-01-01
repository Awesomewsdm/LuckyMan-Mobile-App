import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_selection_model.dart';
import 'package:luckyman_app/src/repository/authentification/booking_repository.dart';
import 'package:luckyman_app/src/repository/authentification/user_repository.dart';
import '../models/Booking_Models/user_booking_model.dart';

class BusBookingController extends GetxController {
  static BusBookingController get instance => Get.find();
  final _userRepo = Get.put(UserRepository());
  final _bookingRepo = Get.put(BookingRepository());

  final _db = FirebaseFirestore.instance;

  final selectedDestination = ''.obs;
  final selectedBusType = ''.obs;
  final selectedOrigin = ''.obs;
  final selectedDepartureTime = ''.obs;
  final selectedDepartureDate = ''.obs;
  final selectedPickupPoint = ''.obs;
  final selectedSchool = ''.obs;
  final selectedAgentName = "".obs;
  final clientReference = "".obs;
  final tokenID = "".obs;
  final selectedBusClass = "".obs;
  RxString reference = "".obs;
  RxList<dynamic> userSelectedSeats = [].obs;

  RxList<dynamic> busSeatsList = [].obs;

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

  addBusBookingInfo(UserBookingModel userBookingModel, String userDocRef,
      String userBookingInfoDocRef) async {
    await _userRepo.addBooking(
        userBookingModel, userDocRef, userBookingInfoDocRef);
    // QR.toName(Routes.seatSelectionPage);
  }

  updateUserBookingData(
      UserBookingModel userBookingModel, String userDocRef) async {
    await _userRepo.updateUserBookingDetails(userBookingModel, userDocRef);
  }

  Future<void> updateBusSeatsList(String busDocRefID,
      List<dynamic> userSelectedSeats, String passengers) async {
    await _bookingRepo.updateBookedSeatsList(
        busDocRefID, userSelectedSeats, passengers);
  }

  addSeatSelectionInfo(
      SeatSelectionModel seatSelectionModel, String userDocRef) async {
    await _userRepo.addBookedSeat(seatSelectionModel, userDocRef);
  }

  // Future<List<BusModel>> getAllRequestedBuses(
  //     String destination, String origin, String departureDate) async {
  //   return await _bookingRepo.getAllRequestedBuses(
  //       destination, origin, departureDate);
  // }

  Future<DocumentSnapshot<Map<String, dynamic>>> getBookingDataFromDB(
      String docID) async {
    return await FirebaseFirestore.instance
        .collection("Booking Data")
        .doc(docID)
        .get();
  }
}
