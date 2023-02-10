import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Models/seat_selection_model.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/repository/authentification/booking_repository.dart';
import 'package:luckyman_app/Models/user_booking_model.dart';

class BusBookingController extends GetxController {
  static BusBookingController get instance => Get.find();
  final _bookingRepo = Get.put(BookingRepository());

  final selectedDestination = ''.obs;
  final selectedBusType = ''.obs;
  final selectedDepatureTime = ''.obs;
  final selectedDepatureDate = ''.obs;
  final selectedPickupPoint = ''.obs;

  final agentName = TextEditingController();

  addBusBookingInfo(UserBookingModel userBookingModel) async {
    await _bookingRepo.addBooking(userBookingModel);
  }

  addSeatSelectionInfo(
      UserModel user, SeatSelectionModel seatSelectionModel) async {
    await _bookingRepo.addSeatSelectionInfo(seatSelectionModel, user);
  }
}
