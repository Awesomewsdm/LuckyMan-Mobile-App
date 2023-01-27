import '../seat_layout_mode.dart';

final executiveseatLayout = SeatLayoutModel(
  rows: 10,
  cols: 4,
  seatTypes: [
    {"Accra": 125},
    {"Tema: ": 135},
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
