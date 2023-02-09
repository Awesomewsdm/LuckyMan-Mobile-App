import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Models/seat_selection_model.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/Models/user_booking_model.dart';
import 'package:luckyman_app/src/repository/authentification/user_repository.dart';

class BusBookingController extends GetxController {
  static BusBookingController get instance => Get.find();
  final userRepo = Get.put(UserRepository());

  final selectedDestination = ''.obs;
  final selectedBusType = ''.obs;
  final selectedDepatureTime = ''.obs;
  final selectedDepatureDate = ''.obs;
  final selectedPickupPoint = ''.obs;

  final agentName = TextEditingController();

  addBusBookingInfo(UserModel user) async {
    await userRepo.addBooking(user);
  }

  // addSeatSelectionInfo(
  //     UserModel user, SeatSelectionModel seatSelectionModel) async {
  //   await _bookingRepo.addSeatSelectionInfo(seatSelectionModel, user);
  // }
}
