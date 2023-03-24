import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/seat_llayout_builder/seat_layout_builder.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_layout_mode.dart';

class SunyaniExecutiveSeatLayout extends StatelessWidget {
  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());
  SunyaniExecutiveSeatLayout({Key? key, this.model}) : super(key: key);
  final SeatLayoutModel? model;
  @override
  Widget build(BuildContext context) {
    return SeatLayoutBuilder(
      model: model,
      seatSelectionController: seatSelectionController,
      destination: "Sunyani",
      selectedSeatList: seatSelectionController.selectedSunyaniExecutiveSeats,
      amount: seatSelectionController.pSunyaniExecutiveseatPrice,
      busClass: "executive",
    );
  }
}
