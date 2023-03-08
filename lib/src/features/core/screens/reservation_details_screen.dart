import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/booking/ticket_data_widget.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/seat_selection_controller.dart';

import 'package:ticket_widget/ticket_widget.dart';

class BusTicketScreen extends StatelessWidget {
  BusTicketScreen({Key? key}) : super(key: key);
  static const String id = '/BusTicketScreen';

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final SeatSelectionController seatSelectionController = Get.put(
    SeatSelectionController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPrimaryAppBar(tReservationDetailsScreenTitle),
      body: const Center(
        child: TicketWidget(
          width: 350,
          height: 500,
          isCornerRounded: true,
          padding: EdgeInsets.all(20),
          child: TicketData(),
        ),
      ),
    );
  }
}
