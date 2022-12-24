import 'package:flutter/material.dart';

var kBackgroundBoxDecoration = BoxDecoration(
  border: Border.all(color: Colors.blue),
  boxShadow: const [
    BoxShadow(
      blurStyle: BlurStyle.outer,
      blurRadius: 1.0,
    ),
  ],
  color: const Color.fromARGB(255, 255, 255, 255),
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(18.0),
    topRight: Radius.circular(18.0),
  ),
);

const kSeatScreenBoxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      blurStyle: BlurStyle.outer,
      offset: Offset(-1, -1),
      blurRadius: 2.0,
    ),
  ],
  color: Color.fromARGB(255, 255, 255, 255),
  borderRadius: BorderRadius.all(
    Radius.circular(20.0),
  ),
);

const kEnableBorderSideColor = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);

const kFocusedBorderColor = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  borderSide: BorderSide(
    color: Colors.blue,
  ),
);

Color selectedSeatColor = const Color(0xFF2575EE);
Color bookedSeatColor = const Color(0xFFFF6E6F);
Color emptySeatColor = const Color(0xFFF7F7F7);
Color? seatBorder;

Color activeSeatNumberColor = const Color.fromARGB(255, 255, 255, 255);
Color inactiveSeatNumberColor = const Color(0xFF929292);

double seatSize = 35.0;
