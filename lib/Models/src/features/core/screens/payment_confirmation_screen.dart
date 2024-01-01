import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/profile_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/models/utils/API/api_get_payment_details.dart';
import 'package:luckyman_app/src/features/core/screens/all_available_buses.dart';
import 'package:luckyman_app/src/features/core/screens/reservation_details_screen.dart';
import '../models/Booking_Models/user_booking_model.dart';

class PaymentConfirmationScreen extends StatefulWidget {
  const PaymentConfirmationScreen({super.key});

  static String id = "/PaymentConfirmationScreen";

  @override
  _PaymentConfirmationScreenState createState() =>
      _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final ProfileController profileController = Get.put(ProfileController());
  final _db = FirebaseFirestore.instance;

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isPaymentConfirmed = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    confirmPayment();
  }

  Future<void> confirmPayment() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Simulate payment confirmation delay
      var clientRef = await PaymentData().getPaymentDataFromWebhook(
        busBookingController.clientReference.value,
        busBookingController.tokenID.value,
      );

      if (clientRef != null) {
        bool paymentConfirmed = true;

        setState(() {
          isPaymentConfirmed = paymentConfirmed;
        });

        if (isPaymentConfirmed) {
          var getData = await profileController.getUserData();
          UserModel userData = getData as UserModel;

          String userName = userData.fullName.toString();
          await addBooking();
          await busBookingController.updateBusSeatsList(
            busBookingController.reference.value,
            seatSelectionController.userSelectedSeats.toList(),
            userName,
          );
          Get.to(() => const BusTicketScreen());
        } else {
          Get.to(() => const AllAvailableBuses());
        }
      } else {
        setState(() {
          isPaymentConfirmed = false;
        });
      }
    } catch (error) {
      setState(() {
        isPaymentConfirmed = false;
      });
      // Handle error during payment confirmation
      Get.snackbar(
        "Failed",
        "Couldn't confirm payment",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.blue[100],
        backgroundColor: Colors.blue.withOpacity(0.7),
      );
      // Display an error message or handle it as per your app's requirements
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> addBooking() async {
    var getData = await profileController.getUserData();
    UserModel userData = getData as UserModel;

    String userName = userData.fullName.toString();
    String userPhoneNumber = userData.phoneNumber.toString();

    final UserBookingModel userBookingModel = UserBookingModel(
      selectedDestination: busBookingController.selectedDestination.value,
      selectedOrigin: busBookingController.selectedOrigin.value,
      selectedPickupPoint: busBookingController.selectedPickupPoint.value,
      selectedBusType: busBookingController.selectedBusType.value,
      selectedDepartureTime: busBookingController.selectedDepartureTime.value,
      agentName: busBookingController.agentName.text,
      selectedDepartureDate: busBookingController.selectedDepartureDate.value,
      userName: userName,
      isUserBooked: true,
      isUserBookingComplete: false,
      selectedBusClass: busBookingController.selectedBusClass.value,
      selectedSeatNo: seatSelectionController.userSelectedSeats.join(" , "),
      price: seatSelectionController.seatPrice.toString(),
      phoneNumber: userPhoneNumber,
    );

    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await busBookingController.addBusBookingInfo(
          userBookingModel,
          user.uid,
          busBookingController.clientReference.value,
        );
        var userDocRef = user.uid;
        await _db
            .collection("Users")
            .doc(userDocRef)
            .collection("Booking Info")
            .doc(busBookingController.clientReference.value)
            .update({"isUserBookingComplete": true});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isPaymentConfirmed ? Icons.check_circle : Icons.error,
              color: isPaymentConfirmed ? Colors.green : Colors.red,
              size: 80.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              isPaymentConfirmed ? 'Payment Confirmed' : 'Payment Failed',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isLoading) const SizedBox(height: 16.0),
            const CircularProgressIndicator(),
            if (!isPaymentConfirmed && !isLoading)
              ElevatedButton(
                onPressed: confirmPayment,
                child: const Text('Retry Payment Confirmation'),
              ),
          ],
        ),
      ),
    );
  }
}



// Center(
//         child: Column(
//           children: [
//             Image.asset(tPaymentConfirmationGIF),
//             const BlackTextWidget(
//               text: "Confirming payment",
//               fontSize: 20,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text("Please wait..."),
//             const SizedBox(
//               height: 80,
//             ),

//             // navigate to detailed product screen

//             FutureBuilder(
//                 future: PaymentData().getPaymentDataFromWebhook(
//                     busBookingController.clientReference.value,
//                     busBookingController.tokenID.value),
//                 builder: (context, data) {
//                   if (data.connectionState == ConnectionState.done) {
//                     if (data.hasData) {
//                       // Get.to(() => const BusTicketScreen());
//                       return TextButton(
//                         onPressed: () async {
//                           var getData = await profileController.getUserData();
//                           UserModel userData = getData as UserModel;

//                           String userName = userData.fullName.toString();
//                           String userPhoneNumber =
//                               userData.phoneNumber.toString();

//                           final UserBookingModel userBookingModel =
//                               UserBookingModel(
//                             selectedDestination:
//                                 busBookingController.selectedDestination.value,
//                             selectedPickupPoint:
//                                 busBookingController.selectedPickupPoint.value,
//                             selectedBusType:
//                                 busBookingController.selectedBusType.value,
//                             selectedDepatureTime:
//                                 busBookingController.selectedDepatureTime.value,
//                             agentName: busBookingController.agentName.text,
//                             selectedDepatureDate:
//                                 busBookingController.selectedDepatureDate.value,
//                             userName: userName,
//                             isUserBooked: true,
//                             isUserBookingComplete: false,
//                             selectedBusClass: seatSelectionController
//                                 .selectedBusClass.value
//                                 .toString(),
//                             selectedSeatNo: seatSelectionController
//                                 .userSelectedSeats
//                                 .join(" , "),
//                             price: seatSelectionController.seatPrice.toString(),
//                             phoneNumber: userPhoneNumber,
//                           );

//                           FirebaseAuth.instance
//                               .authStateChanges()
//                               .listen((User? user) async {
//                             if (user != null) {
//                               await busBookingController.addBusBookingInfo(
//                                   userBookingModel,
//                                   user.uid,
//                                   busBookingController.clientReference.value);
//                               var userDocRef = user.uid;
//                               await _db
//                                   .collection("Users")
//                                   .doc(userDocRef)
//                                   .collection("Booking Info")
//                                   .doc(busBookingController
//                                       .clientReference.value)
//                                   .update({"isUserBookingComplete": true}).then(
//                                 (value) => Get.to(
//                                   () => const BusTicketScreen(),
//                                 ),
//                               );
//                               // await busBookingController.updateUserBookingData(
//                               //     userBookingModel, user.uid
//                               // );
//                             }
//                           });
//                         },
//                         child: const Text("View Ticket"),
//                       );
//                     }

//                     return Column(
//                       children: [
//                         const Text("No payment received"),
//                         Row(
//                           children: [
//                             ElevatedButton(
//                               onPressed: () {},
//                               child: const Text("Try Again"),
//                             ),
//                           ],
//                         ),
//                         ElevatedButton(
//                             onPressed: () {}, child: const Text("data")),
//                       ],
//                     );
//                   } else {
//                     return const Center(
//                       child: Column(
//                         children: [
//                           CircularProgressIndicator(),
//                           Text("Confirming payment, please wait"),
//                         ],
//                       ),
//                     );
//                   }
//                 }),

//             const CircularProgressIndicator()
//           ],
//         ),
//       ),