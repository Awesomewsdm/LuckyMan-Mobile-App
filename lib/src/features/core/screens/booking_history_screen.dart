import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/booking/ticket_history_data.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/profile_controller.dart';
import 'package:ticket_widget/ticket_widget.dart';

class BookingHistory extends StatelessWidget {
   BookingHistory({Key? key}) : super(key: key);
  static const id = "/BookingHistory";

  final ProfileController profileController = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: Column(
        children: [
          getPrimaryAppBar(tBookingHistoryScreenTittle),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
        child: FutureBuilder(
          future: profileController.getUserData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                if (userData.isUserBooked == true) {
                  return  TicketWidget(
                    width: 350,
                    height: 500,
                    isCornerRounded: true,
                    padding: const EdgeInsets.all(20),
                    child: TicketHistoryData(),
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
          )
        ],
      ),
    );
  }
}

