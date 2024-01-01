import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/constants/string_extensions.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/ticket_controllers.dart';
import 'package:luckyman_app/src/features/core/models/utils/API/api_get_payment_details.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'ticket_details_widget.dart';

class TicketData extends StatefulWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  State<TicketData> createState() => _TicketDataState();
}

class _TicketDataState extends State<TicketData> {
  final TicketController ticketController = Get.put(TicketController());

  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final FirebaseAuth auth = FirebaseAuth.instance;

  late String paymentDataFromWebhook;

  @override
  void initState() {
    super.initState();

    paymentDataFromWebhook = PaymentData()
        .getPaymentDataFromWebhook(busBookingController.clientReference.value,
            busBookingController.tokenID.value)
        .toString();
    // print(paymentDataFromWebhook);
  }

  @override
  Widget build(BuildContext context) {
    var user = auth.currentUser!;
    var userDocRef = user.uid;
    return FutureBuilder(
        future: ticketController.getUserBookingInfo(
            userDocRef, busBookingController.clientReference.value),
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
              // String selectedInstitution =
              //     userBookingData['selectedInstitution'];
              String amountPaid = userBookingData['price'];
              String selectedOrigin = userBookingData['selectedOrigin'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 125.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(width: 1.0, color: tGreenColor),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  selectedBusType,
                                  style: const TextStyle(
                                    color: Colors.pink,
                                  ),
                                ),
                                const VerticalDivider(
                                  color: tGreenColor,
                                  thickness: 2,
                                ),
                                Text(
                                  selectedBusClass,
                                  style: const TextStyle(
                                    color: tGreenColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                selectedDestination,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.flight_takeoff,
                                color: Colors.pink,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                selectedOrigin,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
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
                        ticketDetailsWidget(
                          'Seat No',
                          selectedSeatList,
                          'Price',
                          amountPaid,
                        ),
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
                            'Pickup Point',
                            selectedPickupPoint.limitToLetters(20),
                            "",
                            "",
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
                        data: busBookingController.clientReference.value,
                        size: 170,
                      ),
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
