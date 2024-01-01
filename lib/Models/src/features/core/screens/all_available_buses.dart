import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/booking/bus_info_card_widget.dart';
import 'package:luckyman_app/src/constants/image_strings.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/screens/seat_selection_screen.dart';

class AllAvailableBuses extends StatefulWidget {
  final String? departureDate;
  final String? destination;
  final String? origin;

  const AllAvailableBuses(
      {super.key, this.departureDate, this.destination, this.origin});

  @override
  State<AllAvailableBuses> createState() => _AllAvailableBusesState();
}

class _AllAvailableBusesState extends State<AllAvailableBuses> {
  final BusBookingController bookingController =
      Get.put(BusBookingController());

  Future<List<DocumentSnapshot>> _getBuses() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Buses")
        .where("destination", isEqualTo: widget.destination)
        .where("origin", isEqualTo: widget.origin)
        .where("departureDate", isEqualTo: widget.departureDate)
        .get();

    return snapshot.docs;
  }

  late Future<List<DocumentSnapshot>> _fetchBuses;

  bool _isRefreshing = false;

  Future<void> _refreshBuses() async {
    if (!_isRefreshing) {
      setState(() {
        _isRefreshing = true;
      });

      _fetchBuses = _getBuses();

      setState(() {
        _isRefreshing = false;
      });
    }
  }

  void printDocumentData(DocumentSnapshot document) {
    final Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

    if (data != null) {
      data.forEach((key, value) {
        print('$key: $value');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Available Buses",
        onPressed: () {},
      ).getPrimaryAppBar(),
      body: RefreshIndicator(
        onRefresh: _refreshBuses,
        child: FutureBuilder<List<DocumentSnapshot>>(
            future: _getBuses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                    child: Column(
                  children: [
                    Image.asset(t404Image),
                    Text('Error: ${snapshot.error}'),
                  ],
                ));
              }

              if (snapshot.hasData) {
                final List<DocumentSnapshot> busSnapshot = snapshot.data ?? [];
                // return const Center(
                //   child: Text("Sorry, no bus available at this location"),
                // );
                for (final bus in busSnapshot) {
                  printDocumentData(bus);
                }

                return Column(
                  children: [
                    const Text("AVAILABLE BUSES ON"),
                    Text(busBookingController.selectedDepartureDate.value),
                    Expanded(
                      child: ListView.builder(
                        itemCount: busSnapshot.length,
                        itemBuilder: (context, index) {
                          final buses = busSnapshot[index];

                          final Map<String, dynamic> bus =
                              buses.data() as Map<String, dynamic>;

                          final List<dynamic> bookedSeats =
                              busSnapshot[index]["bookedSeats"];

                          final noOfSeats = bus["noOfSeats"];

                          final remainingSeats = noOfSeats - bookedSeats.length;

                          var ticketPriceFromDB = bus["ticketPrice"];

                          var ticketPrice = ticketPriceFromDB.toDouble();

                          busBookingController.selectedPickupPoint.value =
                              bus["pickupPoint"];
                          busBookingController.selectedBusType.value =
                              bus["busType"];
                          busBookingController.selectedDepartureTime.value =
                              bus["departureTime"];
                          busBookingController.selectedBusClass.value =
                              bus["busClass"];
                          busBookingController.busSeatsList.value =
                              bus['bookedSeats'] as List<dynamic>;
                          busBookingController.reference.value =
                              buses.reference.id;
                          return BusInfoCard(
                              onTap: () {
                                Get.to(() => SeatSelectionScreen(
                                      busSnapshot: buses,
                                    ));
                              },
                              busNo: bus["busNo"] ?? "",
                              ticketPrice: ticketPrice.toString(),
                              departureDate: bus["departureDate"] ?? "",
                              departureTime: busBookingController
                                  .selectedDepartureTime.value,
                              busType:
                                  busBookingController.selectedBusType.value,
                              origin: bus["origin"] ?? "",
                              destination: bus["destination"] ?? "",
                              pickupPoint: busBookingController
                                  .selectedPickupPoint.value,
                              remainingSeats: remainingSeats,
                              bookedSeats: '${bookedSeats.length}');
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                    child: Column(
                  children: [
                    Image.asset(t404Image),
                    const BlackTextWidget(
                        text:
                            "Sorry, no bus available at this moment, check other options")
                  ],
                ));
              }
            }),
      ),
    );
  }
}
