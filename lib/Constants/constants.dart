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

double seatSize = 35.0;
