import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_layout_mode.dart';

final SeatSelectionController seatSelectionController =
    Get.put(SeatSelectionController());


final executiveseatLayout = SeatLayoutModel(
  rows: 10,
  cols: 4,
  seatTypes: [
    {"Accra": 125},
    {"Tema": 135},
    {"Takoradi": 150},
    {"Kasoa": 125},
    {"Sunyani": 110},
    {"Cape Coast": 130.00},
    {"Madina": 135},
    {"Koforidua": 95},
  ],
  gap: 2,
  gapColIndex: 2,
  isLastFilled: true,
  rowBreaks: [10],
);
