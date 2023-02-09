// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:luckyman_app/Models/seat_selection_model.dart';
// import 'package:luckyman_app/Models/user_booking_model.dart';
// import 'package:luckyman_app/src/features/authentification/models/user_model.dart';

// class BookingRepository extends GetxController {
//   static BookingRepository get instance => Get.find();
//   final _db = FirebaseFirestore.instance;

//   addSeatSelectionInfo(
//       SeatSelectionModel seatSelectionModel, UserModel user) async {
//     await _db
//         .collection('Users')
//         .doc(user.id)
//         .update(seatSelectionModel.toMap());
//   }
// }
