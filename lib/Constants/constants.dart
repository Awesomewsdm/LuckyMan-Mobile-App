import 'package:flutter/material.dart';

var kBackgroundBoxDecoration = const BoxDecoration(
  boxShadow: [
    BoxShadow(
        blurStyle: BlurStyle.outer,
        offset: Offset(0, 3),
        blurRadius: 2.0,
        spreadRadius: 5.0,
        color: Colors.black),
  ],
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15.0),
    topRight: Radius.circular(15.0),
  ),
);

var kHomeBackgroundBoxDecoration = const BoxDecoration(
  // boxShadow: [
  //   BoxShadow(
  //       // blurStyle: BlurStyle.outer,
  //       // blurRadius: 1.0
  //       ),
  // ],
  color: Color.fromARGB(253, 253, 253, 253),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

var kHomeBackgroundBoxDecoration2 = const BoxDecoration(
  color: Colors.lightBlue,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
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
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
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
Color? backgroundColor1 = const Color(0xFFF1F1FE);
Color? backgroundColor2 = const Color(0xFFF3F5F7);
Color? backgroundColor3 = const Color(0xFFF4F4F4);
Color? backgroundColor4 = const Color(0xFFF5F6FA);
Color? backgroundColor5 = const Color(0xFFF5F6FA);
Color? primaryTextColor = const Color(0xFF151940);

Color activeSeatNumberColor = const Color.fromARGB(255, 255, 255, 255);
Color inactiveSeatNumberColor = const Color(0xFF929292);

double seatSize = 35.0;

// BoxShadow primaryBoxShadow = const 
