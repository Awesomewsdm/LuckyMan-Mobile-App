// import 'dart:core';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
// import 'package:luckyman_app/src/common_widgets/booking/bus_info_card_widget.dart';
// import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
// import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
// import 'package:luckyman_app/src/features/core/models/Booking_Models/bus_model.dart';

// class AlLBusses extends StatefulWidget {
//   const AlLBusses({super.key});

//   @override
//   State<AlLBusses> createState() => _AllAvailableBusesState();
// }

// class _AllAvailableBusesState extends State<AlLBusses> {
//   final BusBookingController bookingController =
//       Get.put(BusBookingController());

//   final destination = busBookingController.selectedDestination.value;

//   final origin = busBookingController.selectedOrigin.value;

//   final departureDate = busBookingController.selectedDepatureDate.value;

//   final _db = FirebaseFirestore.instance;

//   Future<List<DocumentSnapshot>> _getBuses() async {
//     final QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection("Buses")
//         .where("destination", isEqualTo: "Accra")
//         .where("origin", isEqualTo: "KNUST")
//         .where("departureDate", isEqualTo: "13-05-2023")
//         .get();

//     return snapshot.docs;
//   }

//   Future<List<BusModel>> _fetchAvailableBuses() async {
//     final QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collection('Buses').get();

//     return snapshot.docs.map((doc) {
//       return BusModel.fromMap(doc.data() as Map<String, dynamic>);
//     }).toList();
//   }

//   late Future<List<DocumentSnapshot>> _fetchBuses;

//   bool _isRefreshing = false;

//   Future<void> _refreshBuses() async {
//     if (!_isRefreshing) {
//       setState(() {
//         _isRefreshing = true;
//       });

//       _fetchBuses = _getBuses();

//       setState(() {
//         _isRefreshing = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PrimaryAppBar(
//         title: "Available Buses",
//         onPressed: () async {
//           await _db
//               .collection("Buses")
//               .where("destination", isEqualTo: "Accra")
//               .where("origin", isEqualTo: "KNUST")
//               .where("departureDate", isEqualTo: "13-05-2023")
//               .get()
//               .then((QuerySnapshot snapshot) => {
//                     for (var element in snapshot.docs) {print(element.data())}
//                   });
//           // print();
//         },
//       ).getPrimaryAppBar(),
//       body: RefreshIndicator(
//         onRefresh: _refreshBuses,
//         child: FutureBuilder<List<BusModel>>(
//             future: _fetchAvailableBuses(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }

//               // final List<DocumentSnapshot> allBuses = snapshot.data ?? [];
//               // // return const Center(
//               // //   child: Text("Sorry, no bus available at this location"),
//               // // );

//               final List<BusModel> buses = snapshot.data!;

//               return ListView.builder(
//                 itemCount: buses.length,
//                 itemBuilder: (context, index) {
//                   return ListView.builder(
//                     itemCount: buses.length,
//                     itemBuilder: (context, index) {
//                       final bus = buses[index];
//                       final bookedSeats = bus.bookedSeats.length;
//                       final remainingSeats = bus.noOfSeats - bookedSeats;
//                       return BusInfoCard(
//                         busNo: bus.busNo,
//                         ticketPrice: '${bus.ticketPrice}',
//                         departureDate: bus.departureDate,
//                         departureTime: bus.departureTime,
//                         busType: bus.busType,
//                         origin: bus.origin,
//                         destination: bus.destination,
//                         pickupPoint: bus.pickupPoint,
//                         remainingSeats: "$remainingSeats",
//                         bookedSeats: "$bookedSeats",
//                       );
//                     },
//                   );
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }
