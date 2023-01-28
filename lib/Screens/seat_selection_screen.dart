import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/Screens/payment_page.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/features/authentification/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';

import '../Components/seat_status.dart';

import '../Models/utils/form_items.dart';
import '../src/common_widgets/dropdown_menu/bus_class_menu.dart';

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
        centerTitle: true,
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
      ),
      backgroundColor: const Color.fromARGB(251, 243, 240, 255),
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
                      child: seatSelectionController.selectedBusType.value ==
                              busClasses[0]
                          ? seatSelectionController.changeEconomySeatsLayout()
                          : seatSelectionController
                              .changeExecutiveSeatsLayout()),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: size.height * 0.15,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AshTextWidget(text: 'Selected Seat'),
                          seatSelectionController.selectedBusType.value ==
                                  busClasses[0]
                              ? Obx(
                                  () => Text(
                                    seatSelectionController
                                        .changeEconomySeatList(),
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                )
                              : Obx(
                                  () => Text(
                                    seatSelectionController
                                        .changeExecutiveSeatList(),
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Column(
                        children: [
                          const AshTextWidget(text: 'Total Price'),
                          seatSelectionController.selectedBusType.value ==
                                  busClasses[0]
                              ? Obx(
                                  () => Text(
                                    'GH¢${seatSelectionController.changeExecutiveSeatPrice()}',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                )
                              : Obx(
                                  () => Text(
                                    'GH¢${seatSelectionController.changeEconomySeatPrice()}',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w900,
                                    ),
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
                    final UserModel user = UserModel(
                        // seatNo: selectedDestination == busClasses[0]
                        //     ? seatSelectionController.changeEconomySeatList()
                        //     : seatSelectionController
                        //         .selectedAccraExecutiveSeats,
                        price: selectedDestination == busClasses[0]
                            ? seatSelectionController.changeEconomySeatPrice()
                            : seatSelectionController
                                .changeExecutiveSeatPrice());
                    Get.to(
                      () => const PaymentPage(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
