
import 'package:luckyman_app/Models/seat_layout_mode.dart';

final economyseatLayout = SeatLayoutModel(
  rows: 12,
  cols: 5,
  seatTypes: [
    {"Accra": 110.00},
    {"Tema": 135.00},
    {"Takoradi": 135.00},
    {"Kasoa": 110.00},
    {"Sunyani": 110},
    {"Cape Coast": 130.00},
    {"Madina": 125.00},
    {"Koforidua": 90},
  ],
  gap: 2,
  gapColIndex: 2,
  isLastFilled: true,
  rowBreaks: [11],
);
