// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:luckyman_app/src/constants/form_items.dart';
// import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
// import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
// import 'package:luckyman_app/src/features/core/controllers/buttons_controller.dart';
// import 'package:luckyman_app/src/features/core/controllers/profile_controller.dart';
// import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
// import 'package:luckyman_app/src/features/core/models/Booking_Models/user_booking_model.dart';
// import 'package:luckyman_app/src/features/core/models/utils/API/api_get_payment_details.dart';
// import 'package:luckyman_app/src/features/core/screens/reservation_details_screen.dart';

// // -- Controllers
// final SeatSelectionController seatSelectionController =
//     Get.put(SeatSelectionController());

// final BusBookingController busBookingController =
//     Get.put(BusBookingController());

// final ButtonController buttonController = Get.put(ButtonController());

// final ProfileController profileController = Get.put(ProfileController());

// final _db = FirebaseFirestore.instance;
// final FirebaseAuth auth = FirebaseAuth.instance;

// class DynamicLinkProvider {
//   Future<String> createDynamicLink() async {
//     const String url = "https://com.example.luckyman";

//     final dynamicLinkParams = DynamicLinkParameters(
//       link: Uri.parse(url),
//       uriPrefix: "https://luckyman.page.link",
//       androidParameters: const AndroidParameters(
//           packageName: "com.example.luckyman", minimumVersion: 0),
//     );

//     final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
//       dynamicLinkParams,
//       shortLinkType: ShortDynamicLinkType.unguessable,
//     );
//     final String generatedDynamicLink = dynamicLink.shortUrl.toString();
//     return generatedDynamicLink;
//   }

//   // confirmPayment() async {

//   Future<bool> showPaymentConfirmationDialog(context) async {
//     return await showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (dialogContext) {
//           return const Dialog(
//             child: Column(
//               children: [
//                 CircularProgressIndicator(),
//                 Text("Confirming payment, please wait...")
//               ],
//             ),
//           );
//         });
        
//     //   var paymentDataFromWebhook = await PaymentData().getPaymentDataFromWebhook(
//     //       seatSelectionController.clientReference.value,
//     //       seatSelectionController.tokenID.value);
//     //   // .toString();

//     //   print(paymentDataFromWebhook.toString());

//     //   var getData = await profileController.getUserData();

//     //   UserModel userData = getData as UserModel;

//     //   String userName = userData.fullName.toString();
//     //   String userPhoneNumber = userData.phoneNumber.toString();

//     //   final UserBookingModel userBookingModel = UserBookingModel(
//     //     selectedDestination: busBookingController.selectedDestination.value,
//     //     selectedPickupPoint: busBookingController.selectedPickupPoint.value,
//     //     selectedBusType: busBookingController.selectedBusType.value,
//     //     selectedDepatureTime: busBookingController.selectedDepatureTime.value,
//     //     agentName: busBookingController.agentName.text,
//     //     selectedDepatureDate: busBookingController.selectedDepatureDate.value,
//     //     userName: userName,
//     //     isUserBooked: true,
//     //     isUserBookingComplete: false,
//     //     selectedBusClass:
//     //         seatSelectionController.selectedBusClass.value.toString(),
//     //     selectedSeatNo:
//     //         seatSelectionController.selectedBusClass.value == busClasses[0]
//     //             ? seatSelectionController.changeEconomySeatList().join(" , ")
//     //             : seatSelectionController.changeExecutiveSeatList().join(" , "),
//     //     price: seatSelectionController.selectedBusClass.value == busClasses[0]
//     //         ? seatSelectionController.changeEconomySeatPrice().toString()
//     //         : seatSelectionController.changeExecutiveSeatPrice().toString(),
//     //     phoneNumber: userPhoneNumber,
//     //   );

//     //   FirebaseAuth.instance.authStateChanges().listen((User? user) async {
//     //     if (user != null) {
//     //       await busBookingController.addBusBookingInfo(userBookingModel, user.uid,
//     //           seatSelectionController.clientReference.value);

//     //       Get.to(() => const BusTicketScreen());

//     //       // await busBookingController.updateUserBookingData(
//     //       //     userBookingModel, user.uid
//     //       // );
//     //     }
//     //   });
//     // }

//     // changeIsSeatBookedStatus() async {
//     //   var user = auth.currentUser!;
//     //   var userDocRef = user.uid;
//     //   await _db
//     //       .collection("Users")
//     //       .doc(userDocRef)
//     //       .collection("Booking Info")
//     //       .doc(seatSelectionController.clientReference.value)
//     //       .update({"isUserBookingComplete": true});
//     // }

//     // Future<bool> showPaymentConfirmationDialog(context) async {
//     //   return await showDialog(
//     //       barrierDismissible: false,
//     //       context: context,
//     //       builder: (dialogContext) {
//     //         return FutureBuilder(
//     //             future: PaymentData().getPaymentDataFromWebhook(
//     //                 seatSelectionController.clientReference.value,
//     //                 seatSelectionController.tokenID.value),
//     //             builder: (context, data) {
//     //               if (data.connectionState == ConnectionState.done) {
//     //                 return const Text("Payment confirmed");

//     //               } else {
//     //                 return const Center(
//     //                   child: Column(
//     //                     children: [
//     //                       CircularProgressIndicator(),
//     //                       Text("Confirming payment, please wait"),
//     //                     ],
//     //                   ),
//     //                 );
//     //               }
//     //             });
//     //       });

//     // final dialogContextCompleter = Completer<BuildContext>();

//     // final dialogContext = await dialogContextCompleter.future;
//     // Navigator.pop(dialogContext);
//     // return await showDialog(
//     //         barrierDismissible: false,
//     //         context: context,
//     //         builder: (dialogContext) {

//     //           if (!dialogContextCompleter.isCompleted) {
//     //             dialogContextCompleter.complete(dialogContext);

//     //           }
//     //           return const AlertDialog(content: CircularProgressIndicator());
//     //         }) ??
//     //     false;
//   }

//   void initDynamicLinks(context) async {
//     FirebaseDynamicLinks.instance.onLink;

//     final PendingDynamicLinkData? data =
//         await FirebaseDynamicLinks.instance.getInitialLink();
//     final Uri? deepLink = data?.link;

//     if (deepLink != null) {
//       showPaymentConfirmationDialog(context);
//     }
//   }
// }
