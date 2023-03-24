import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/constants/custom_icons1_icons.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/ticket_controllers.dart';
import 'package:luckyman_app/src/features/core/models/utils/API/api_get_payment_details.dart';
import 'package:luckyman_app/src/features/core/models/utils/form_items.dart';
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

  final _db = FirebaseFirestore.instance;

  changeIsSeatBookedStatus() async {
    var user = auth.currentUser!;
    var userDocRef = user.uid;
    await _db
        .collection("Users")
        .doc(userDocRef)
        .update({"isSeatBooked": true});
  }

  @override
  void initState() {
    super.initState();
    busBookingController.addSeatListToDB(
      seatSelectionController.selectedBusClass.value == busClasses[0]
          ? seatSelectionController.changeEconomySeatList()
          : seatSelectionController.changeExecutiveSeatList(),
      busBookingController.selectedDestination.string,
      seatSelectionController.selectedBusClass.value == busClasses[0]
          ? "booked-economy-seats"
          : "booked-executive-seats",
    );

    print("Hey: ${seatSelectionController.clientReference.value}");

    changeIsSeatBookedStatus();

    PaymentData().getPaymentDataFromWebhook(
        seatSelectionController.clientReference.value,
        seatSelectionController.tokenID.value);
  }

  @override
  Widget build(BuildContext context) {
    var user = auth.currentUser!;
    var userDocRef = user.uid;
    return FutureBuilder(
        future: ticketController.getSeatgetUserBookingInfo(userDocRef),
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

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'KNUST',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(CustomIcons1.busSideIconSideView,
                                size: 15.0, color: Colors.pink),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              selectedDestination,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ticketDetailsWidget(
                            'Time',
                            Text(
                              selectedDepartureTime,
                            ),
                            'Date',
                            Text(selectedDepartureDate)),
                        ticketDetailsWidget(
                          'Pickup Point',
                          Text(
                            selectedPickupPoint,
                          ),
                          'Gate',
                          const Text('66B'),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, right: 53.0),
                          child: ticketDetailsWidget(
                            'Seat No',
                            Text(selectedSeatList),
                            'Bus Type',
                            Text(selectedBusType),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Center(
                      child: SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: QrImage(
                          data: "Success: $userName",
                          size: 80,
                        ),
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
              return const Text("Somthing went wrong");
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
