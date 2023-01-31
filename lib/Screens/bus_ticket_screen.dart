import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/widgets.dart';
import 'package:luckyman_app/Models/utils/form_items.dart';
import 'package:luckyman_app/src/common_widgets/booking/ticket_data.dart';
import 'package:luckyman_app/src/features/authentification/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/authentification/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/authentification/controllers/ticket_controllers.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';

class BusTicketScreen extends StatelessWidget {
  BusTicketScreen({Key? key}) : super(key: key);
  static const String id = '/BusTicketScreen';

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: TicketWidget(
          width: 350,
          height: 500,
          isCornerRounded: true,
          padding: const EdgeInsets.all(20),
          child: TicketData(),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  TicketData({
    Key? key,
  }) : super(key: key);
  final TicketController ticketController = Get.put(TicketController());

  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  final BusBookingController busBookingController =
      Get.put(BusBookingController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ticketController.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;

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
                            '${seatSelectionController.selectedBusClass.value} Class',
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'KNUST',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.bus_alert_outlined,
                              color: Colors.pink,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              busBookingController.selectedDestination.value,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Bus Ticket',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ticketDetailsWidget(
                          'Name',
                          Text(
                            userData.fullName.toString(),
                          ),
                          'Date Purchased',
                          const Text('28-08-2022'),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, right: 52.0),
                          child: ticketDetailsWidget(
                            'Destination',
                            Obx(() => Text(
                                  busBookingController
                                      .selectedDestination.value,
                                )),
                            'Gate',
                            const Text('66B'),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, right: 53.0),
                          child: ticketDetailsWidget(
                            'Bus Type',
                            Obx(() => Text(
                                busBookingController.selectedBusType.value)),
                            'Seat No',
                            Obx(
                              () => Text(
                                seatSelectionController
                                            .selectedBusClass.value ==
                                        busClasses[0]
                                    ? seatSelectionController
                                        .changeEconomySeatList()
                                    : seatSelectionController
                                        .changeExecutiveSeatList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: Obx(() => QrImage(
                              data:
                                  '${userData.fullName.toString()} - ${seatSelectionController.selectedBusClass.value == busClasses[0] ? seatSelectionController.changeEconomySeatList() : seatSelectionController.changeExecutiveSeatList()}',
                              size: 80,
                            )),
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
