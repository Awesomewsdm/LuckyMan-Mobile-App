import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/profile_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/screens/payment_confirmation_screen.dart';

final SeatSelectionController seatSelectionController =
    Get.put(SeatSelectionController());

final BusBookingController busBookingController =
    Get.put(BusBookingController());

final ProfileController profileController = Get.put(ProfileController());

final _db = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class DynamicLinkHandler {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      // Listen and retrieve dynamic links here
      final String deepLink = dynamicLinkData.link.toString(); // Get DEEP LINK
      // Ex: https://namnp.page.link/product/013232
      final String path = dynamicLinkData.link.path; // Get PATH
      // Ex: product/013232
      if (deepLink.isEmpty) return;
      handleDeepLink(path);
    }).onError((error) {
      // print('onLink error');
      // print(error.message);
    });
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    try {
      final initialLink = await dynamicLinks.getInitialLink();
      if (initialLink == null) return;
      handleDeepLink(initialLink.link.path);
    } catch (e) {
      // Error
    }
  }

  void handleDeepLink(String path) {
    Get.to(() => const PaymentConfirmationScreen());
    // navigate to detailed product screen

    // Get.defaultDialog(
    //   content: Column(
    //     children: [
    //       FutureBuilder(
    //           future: PaymentData().getPaymentDataFromWebhook(
    //               busBookingController.clientReference.value,
    //               busBookingController.tokenID.value),
    //           builder: (context, data) {
    //             if (data.connectionState == ConnectionState.done) {
    //               if (data.hasData) {
    //                 // Get.to(() => const BusTicketScreen());
    //                 return Column(
    //                   children: [
    //                     const Text("Payment confirmed"),
    //                     TextButton(
    //                       onPressed: () async {
    //                         var getData = await profileController.getUserData();
    //                         UserModel userData = getData as UserModel;

    //                         String userName = userData.fullName.toString();
    //                         String userPhoneNumber =
    //                             userData.phoneNumber.toString();

    //                         final UserBookingModel userBookingModel =
    //                             UserBookingModel(
    //                           selectedDestination: busBookingController
    //                               .selectedDestination.value,
    //                           selectedOrigin:
    //                               busBookingController.selectedOrigin.value,
    //                           selectedPickupPoint: busBookingController
    //                               .selectedPickupPoint.value,
    //                           selectedBusType:
    //                               busBookingController.selectedBusType.value,
    //                           selectedDepatureTime: busBookingController
    //                               .selectedDepatureTime.value,
    //                           agentName: busBookingController.agentName.text,
    //                           selectedDepatureDate: busBookingController
    //                               .selectedDepatureDate.value,
    //                           userName: userName,
    //                           isUserBooked: true,
    //                           isUserBookingComplete: false,
    //                           selectedBusClass: seatSelectionController
    //                               .selectedBusClass.value
    //                               .toString(),
    //                           selectedSeatNo: seatSelectionController
    //                               .userSelectedSeats
    //                               .join(" , "),
    //                           price:
    //                               seatSelectionController.seatPrice.toString(),
    //                           phoneNumber: userPhoneNumber,
    //                         );

    //                         FirebaseAuth.instance
    //                             .authStateChanges()
    //                             .listen((User? user) async {
    //                           if (user != null) {
    //                             await busBookingController.addBusBookingInfo(
    //                                 userBookingModel,
    //                                 user.uid,
    //                                 busBookingController.clientReference.value);
    //                             var userDocRef = user.uid;
    //                             await _db
    //                                 .collection("Users")
    //                                 .doc(userDocRef)
    //                                 .collection("Booking Info")
    //                                 .doc(busBookingController
    //                                     .clientReference.value)
    //                                 .update(
    //                                     {"isUserBookingComplete": true}).then(
    //                               (value) => Get.to(
    //                                 () => const BusTicketScreen(),
    //                               ),
    //                             );
    // await busBookingController.updateUserBookingData(
    //     userBookingModel, user.uid
    //                             // );
    //                           }
    //                         });
    //                       },
    //                       child: const Text("View Ticket"),
    //                     ),
    //                   ],
    //                 );
    //               }

    //               return Column(
    //                 children: [
    //                   const Text("No payment received"),
    //                   Row(
    //                     children: [
    //                       ElevatedButton(
    //                         onPressed: () {},
    //                         child: const Text("Try Again"),
    //                       ),
    //                     ],
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {}, child: const Text("data")),
    //                 ],
    //               );
    //             } else {
    //               return const Center(
    //                 child: Column(
    //                   children: [
    //                     CircularProgressIndicator(),
    //                     Text("Confirming payment, please wait"),
    //                   ],
    //                 ),
    //               );
    //             }
    //           }),
    //     ],
    //   ),
    // );
  }
}
