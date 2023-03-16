import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/booking/ticket_data_widget.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/profile_controller.dart';
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

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPrimaryAppBar(tReservationDetailsScreenTitle),
      body: Center(
        child: FutureBuilder(
          future: profileController.getUserData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                if (userData.isUserBooked == true) {
                  return const TicketWidget(
                    width: 350,
                    height: 500,
                    isCornerRounded: true,
                    padding: EdgeInsets.all(20),
                    child: TicketData(),
                  );
                } else {
                  return const Center(
                    child: Text("Sorry you've not booked any seat yet"),
                  );
                }
              } else {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              return const Center(
                child: Text("Loading..."),
              );
            }
          },
        ),
      ),
    );
  }
}
