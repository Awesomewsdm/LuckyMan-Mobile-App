import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/core/controllers/profile_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/reservation_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/booking_history_model.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/rich_text_widget.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/tcket_history_widget.dart';
import 'package:luckyman_app/src/repository/authentification/booking_repository.dart';

class BookingHistory extends StatelessWidget {
  BookingHistory({Key? key}) : super(key: key);
  static const id = "/BookingHistory";

  final ProfileController profileController = Get.put(ProfileController());
  final ReservationController reservationController =
      Get.put(ReservationController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: tWhiteColor,
      child: Column(
        children: [
          PrimaryAppBar(
              title: tBookingHistoryScreenTittle,
              onPressed: () {
                Get.back();
              }).getPrimaryAppBar(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<List<BookingHistoryData>>(
                future: BookingRepository().getUserBookingHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: kHomeWidgetsBoxDecoration,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          TicketHistoryWidget(
                                            destination: snapshot
                                                .data![index].selectedOrigin,
                                            title: 'FROM',
                                            icon: Icons.location_pin,
                                            circledAvatarColor:
                                                const Color.fromRGBO(
                                                    2, 138, 72, 1),
                                            fontSize: 18,
                                            textColor: tLightBlue,
                                          ),
                                          const Spacer(),
                                          TicketRichTextWidget(
                                            title: "SEAT NO  ",
                                            destination: snapshot
                                                .data![index].selectedSeatNo,
                                            fontSize: 18,
                                            textColor: tLightBlue,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          TicketHistoryWidget(
                                            destination: snapshot.data![index]
                                                .selectedDestination,
                                            title: 'TO',
                                            icon: Icons.telegram,
                                            circledAvatarColor: tLightBlue,
                                            fontSize: 18,
                                            textColor: tLightBlue,
                                          ),
                                          const Spacer(),
                                          TicketRichTextWidget(
                                            title: "DATE  ",
                                            destination: snapshot.data![index]
                                                .selectedDepatureDate,
                                            fontSize: 15,
                                            textColor: tLightBlue,
                                          ),
                                          const Spacer(),
                                          TicketRichTextWidget(
                                            title: "PRICE  ",
                                            destination:
                                                snapshot.data![index].price,
                                            fontSize: 25,
                                            textColor: tLightBlue,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("You've not booked any seats yet"),
                      );
                    }
                  }

                  return const Center(
                    child: Text("Loading your booking history, please wait"),
                  );
                }),
          )
        ],
      ),
    );
  }
}
