import 'package:angie_notebook/Models/seat_layout_mode.dart';
import 'package:flutter/material.dart';

class Seats {
  Seats({
    this.selectedSeatColor,
    this.bookedSeatColor,
    this.emptySeatColor,
    this.seatBorder,
    this.seatNumber,
  });

  Color? selectedSeatColor = const Color(0xFF2575EE);
  Color? bookedSeatColor = const Color(0xFFFF6E6F);
  Color? emptySeatColor = const Color(0xFFF7F7F7);
  Color? seatBorder;
  int? seatNumber;
  Color? activeSeatNumberColor = const Color.fromARGB(255, 255, 255, 255);
  Color? inactiveSeatNumberColor = const Color(0xFF929292);
}

final seatLayout = SeatLayoutModel(
  rows: 10,
  cols: 4,
  seatTypes: ['1'],
  gap: 1,
  gapColIndex: 5,
  isLastFilled: true,
  rowBreaks: [10],
);
