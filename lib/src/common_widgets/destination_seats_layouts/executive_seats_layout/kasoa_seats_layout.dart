import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/seat_llayout_builder/seat_layout_builder.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_layout_mode.dart';

class KasoaExecutiveSeatLayout extends StatelessWidget {
  KasoaExecutiveSeatLayout({Key? key, this.model}) : super(key: key);

  final SeatLayoutModel? model;

  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  @override
  Widget build(BuildContext context) {
    return SeatLayoutBuilder(
      model: model,
      seatSelectionController: seatSelectionController,
      destination: "Kasoa",
      selectedSeatList: seatSelectionController.selectedKasoaExecutiveSeats,
      amount: seatSelectionController.pKasoaExecutiveseatPrice,
      busClass: "executive",
    );
  }
}
