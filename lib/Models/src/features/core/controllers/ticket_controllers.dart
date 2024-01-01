import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  static TicketController get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserBookingInfo(
      String userDocRef, String userBookingInfoDocRef) async {
    final snapshot = await _db
        .collection("Users")
        .doc(userDocRef)
        .collection("Booking Info")
        .doc(userBookingInfoDocRef)
        .get();

    return snapshot;
    // ...
  }

  
}
