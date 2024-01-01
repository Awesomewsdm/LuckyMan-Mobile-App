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
  borderRadius: BorderRadius.all(
    Radius.circular(15.0),
  ),
);

var kHomeBackgroundBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20),
  ],
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

double seatSize = 35.0;

// BoxShadow primaryBoxShadow = const
var kHomeWidgetsBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.lightBlue),
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 7),
    ]);

var kPrimaryBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20),
    ]);
