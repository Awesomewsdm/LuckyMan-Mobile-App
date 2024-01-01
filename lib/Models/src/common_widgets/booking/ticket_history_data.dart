import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/ticket_controllers.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../features/core/controllers/seat_selection_controller.dart';
import 'ticket_details_widget.dart';

class TicketHistoryData extends StatefulWidget {
  const TicketHistoryData({
    Key? key,
  }) : super(key: key);

  @override
  State<TicketHistoryData> createState() => _TicketHistoryDataState();
}

class _TicketHistoryDataState extends State<TicketHistoryData> {
  final TicketController ticketController = Get.put(TicketController());

  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var user = auth.currentUser!;
    var userDocRef = user.uid;
    return FutureBuilder(
        future: ticketController.getUserBookingInfo(
            userDocRef, "wO4lJeJPcU3MvqXTn3QPxCc1KaApwQex"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading, please wait"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var userBookingData = snapshot.data;

              String selectedDestination =
                  userBookingData!["selectedDestination"];
              String selectedBusType = userBookingData["selectedBusType"];
              String selectedBusClass = userBookingData["selectedBusClass"];
              String selectedDepartureDate =
                  userBookingData["selectedDepatureDate"];
              String selectedDepartureTime =
                  userBookingData["selectedDepatureTime"];
              String selectedSeatList = userBookingData["selectedSeatNo"];
              String selectedPickupPoint =
                  userBookingData["selectedPickupPoint"];
              String userName = userBookingData['userName'];
              // String selectedInstitution =
              //     userBookingData['selectedInstitution'];
              String amountPaid = userBookingData['price'];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(width: 1.0, color: Colors.green),
                          ),
                          child: Center(
                            child: Text(
                              '$selectedBusClass Class',
                              style: const TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "KNUST",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.flight_takeoff,
                                color: Colors.pink,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                selectedDestination,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        ticketDetailsWidget('Pickup Point', selectedPickupPoint,
                            'Seat No', selectedSeatList),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12.0,
                          ),
                          child: ticketDetailsWidget(
                              'Date',
                              selectedDepartureDate,
                              'Time',
                              selectedDepartureTime),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12.0,
                          ),
                          child: ticketDetailsWidget(
                            'Type',
                            selectedBusType,
                            'Price',
                            amountPaid,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 30.0,
                      right: 30.0,
                    ),
                    child: Center(
                      child: QrImage(
                        data: "Success: $userName",
                        size: 170,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                            child: Text(
                                'Show this ticket to the conductor at the bus terminal')),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return const Text("Something went wrong");
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
