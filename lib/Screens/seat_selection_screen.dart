import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/features/authentification/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';

import '../Components/seat_status.dart';

import '../Models/utils/form_items.dart';
import '../src/common_widgets/dropdown_menu/bus_class_menu.dart';
import 'bus_ticket_screen.dart';

class SeatSelectionScreen extends StatelessWidget {
  SeatSelectionScreen({
    Key? key,
    this.selectedDestination,
  }) : super(key: key);
  static String id = '/SeatSelectionScreen';
  final String? selectedDestination;

  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        centerTitle: true,
        toolbarOpacity: 0.2,
        bottomOpacity: 0.2,
        shadowColor: Colors.white24,
        leadingWidth: 90,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 40.0,
            color: Colors.black,
          ),
        ),
        title: const BlackTextWidget(
          text: 'Select Your Seat',
          fontSize: 20.0,
        ),
      ),
      backgroundColor: backgroundColor5,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SeatStatus(
                  boxColor: emptySeatColor,
                  iconLabel: 'Available',
                ),
                SeatStatus(
                  iconLabel: 'Selected',
                  boxColor: selectedSeatColor,
                ),
                SeatStatus(
                  boxColor: bookedSeatColor,
                  iconLabel: 'Booked',
                ),
              ],
            ),
            const SizedBox(
              height: 2.0,
            ),
            BusClassDropDownMenu(
                size: size, seatSelectionController: seatSelectionController),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () => Container(
                    height: size.height,
                    width: size.width - 50,
                    // color: const Color.fromRGBO(255, 255, 255, 1.0),
                    decoration: kBackgroundBoxDecoration,
                    child: seatSelectionController.selectedBusClass.value ==
                            busClasses[0]
                        ? seatSelectionController.changeEconomySeatsLayout()
                        : seatSelectionController.changeExecutiveSeatsLayout(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: size.height * 0.15,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AshTextWidget(text: 'Selected Seat'),
                        if (seatSelectionController.selectedBusClass.value ==
                            busClasses[0])
                          Text(
                            seatSelectionController.changeEconomySeatList(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        else
                          Text(
                            seatSelectionController.changeExecutiveSeatList(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        const AshTextWidget(text: 'Total Price'),
                        seatSelectionController.selectedBusClass.value ==
                                busClasses[0]
                            ? Text(
                                'GH¢${seatSelectionController.changeEconomySeatPrice()}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              )
                            : Text(
                                'GH¢${seatSelectionController.changeExecutiveSeatPrice()}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BottomButton(
                bottomTextLabel: 'Proceed to make payment',
                onPressed: () {
                  Get.to(
                    () => BusTicketScreen(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
