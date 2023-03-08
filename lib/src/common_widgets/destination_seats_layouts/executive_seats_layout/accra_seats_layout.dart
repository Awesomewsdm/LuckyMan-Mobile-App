import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/seat_llayout_builder/seat_layout_builder.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_layout_mode.dart';

class AccraExecutiveSeatLayout extends StatelessWidget {
  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());
  AccraExecutiveSeatLayout({Key? key, this.model}) : super(key: key);

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final SeatLayoutModel? model;

  @override
  Widget build(BuildContext context) {
    return SeatLayoutBuilder(
      model: model,
      seatSelectionController: seatSelectionController,
      destination: "Accra",
      selectedSeatList: seatSelectionController.selectedAccraExecutiveSeats,
      amount: seatSelectionController.pAccraExecutiveSeatPrice,
      busClass: "executive",
    );
  }
}
