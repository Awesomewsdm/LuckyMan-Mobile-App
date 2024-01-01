import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';

class ReservationController extends GetxController {
  static ReservationController get instance => Get.find();

  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<DocumentSnapshot> getUserReservationDetailsFromDB() async {
    final userID = auth.currentUser!.uid;
    var docSnapshot = await db
        .collection("Users")
        .doc(userID)
        .collection("Booking Info")
        .doc(busBookingController.clientReference.value)
        .get();
    return docSnapshot;
  }
}
