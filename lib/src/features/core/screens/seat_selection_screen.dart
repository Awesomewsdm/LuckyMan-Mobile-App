import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/seat_status.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/common_widgets/dropdown_menu/bus_class_menu.dart';
import 'package:luckyman_app/src/constants/alert.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/constants/custom_icons_icons.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_selection_model.dart';
import 'package:luckyman_app/src/features/core/models/utils/API/api_create_webhook_token.dart';
import 'package:luckyman_app/src/features/core/models/utils/API/api_request.dart';
import 'package:luckyman_app/src/features/core/models/utils/dynamic_links.dart';
import 'package:luckyman_app/src/features/core/models/utils/form_items.dart';
import 'package:url_launcher/url_launcher.dart';

class SeatSelectionScreen extends StatelessWidget {
  SeatSelectionScreen({
    Key? key,
    this.selectedDestination,
  }) : super(key: key);
  static String id = '/SeatSelectionScreen';
  final String? selectedDestination;

  // -- Controllers
  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final ButtonController buttonController = Get.put(ButtonController());

  // @override
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getPrimaryAppBar(tSeatSelectionScreenTitle),
      backgroundColor: backgroundColor5,
      body: SafeArea(
        child: SingleChildScrollView
        (
          child: SizedBox(
            height: size.height,
            width: size.width,
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
                      border: Border.all(
                        color: selectedSeatColor,
                      ),
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
                  size: size,
                  seatSelectionController: seatSelectionController,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Container(
                        height: size.height,
                        width: size.width - 50,
                        decoration: kBackgroundBoxDecoration,
                        child: seatSelectionController.selectedBusClass.value ==
                                null
                            ? Container(
                                width: 120.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      width: 1.0, color: Colors.redAccent),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      FontAwesomeIcons.triangleExclamation,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Please select a bus class to continue',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              )
                            : seatSelectionController.selectedBusClass.value ==
                                    busClasses[0]
                                ? seatSelectionController
                                    .changeEconomySeatsLayout()
                                : seatSelectionController
                                    .changeExecutiveSeatsLayout(),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.15,
                  decoration: const BoxDecoration(
                    color: tWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(CustomIcons.airlineSeatReclineExtra,
                                          size: 25.0, color: tBlueColor),
                                      SizedBox(
                                        width: 6.0,
                                      ),
                                      AshTextWidget(text: 'Selected Seat'),
                                    ],
                                  ),
                                  if (seatSelectionController
                                          .selectedBusClass.value ==
                                      busClasses[0])
                                    Text(
                                      seatSelectionController
                                          .changeEconomySeatList()
                                          .join(" , "),
                                      style: TextStyle(
                                        color: selectedSeatColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    )
                                  else
                                    Text(
                                      seatSelectionController
                                          .changeExecutiveSeatList()
                                          .join(" , "),
                                      style: TextStyle(
                                        color: selectedSeatColor,
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
                                  Row(
                                    children: const [
                                      Icon(FontAwesomeIcons.moneyBill,
                                          size: 18.0, color: tBlueColor),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      AshTextWidget(text: 'Total Price'),
                                    ],
                                  ),
                                  seatSelectionController
                                              .selectedBusClass.value ==
                                          busClasses[0]
                                      ? Text(
                                          'GH¢${seatSelectionController.changeEconomySeatPrice()}',
                                          style: TextStyle(
                                            color: selectedSeatColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )
                                      : Text(
                                          'GH¢${seatSelectionController.changeExecutiveSeatPrice()}',
                                          style: TextStyle(
                                            color: selectedSeatColor,
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
                          bottomTextLabel: 'PROCEED TO PAYMENT',
                          loadingIcon: Obx(
                            () => SizedBox(
                              child:
                                  buttonController.isButtonClicked.value == true
                                      ? const CircularProgressIndicator(
                                          color: tWhiteColor)
                                      : const Text(""),
                            ),
                          ),
                          onPressed: () async {
                            if (seatSelectionController.isSeatSelected.value ==
                                    true &&
                                seatSelectionController
                                        .selectedBusClass.value !=
                                    null) {
                              SeatSelectionModel seatSelectionModel =
                                  SeatSelectionModel(
                                selectedBusClass: seatSelectionController
                                    .selectedBusClass.value,
                                selectedSeatNo: seatSelectionController
                                            .selectedBusClass.value ==
                                        busClasses[0]
                                    ? seatSelectionController
                                        .changeEconomySeatList()
                                        .join(" , ")
                                    : seatSelectionController
                                        .changeExecutiveSeatList()
                                        .join(" , "),
                                price: seatSelectionController
                                            .selectedBusClass.value ==
                                        busClasses[0]
                                    ? seatSelectionController
                                        .changeEconomySeatPrice()
                                        .toString()
                                    : seatSelectionController
                                        .changeExecutiveSeatPrice()
                                        .toString(),
                              );

                              busBookingController.addSeatListToDB(
                                seatSelectionController
                                            .selectedBusClass.value ==
                                        busClasses[0]
                                    ? seatSelectionController
                                        .changeEconomySeatList()
                                    : seatSelectionController
                                        .changeExecutiveSeatList(),
                                busBookingController.selectedDestination.string,
                                seatSelectionController
                                            .selectedBusClass.value ==
                                        busClasses[0]
                                    ? "booked-economy-seats"
                                    : "booked-executive-seats",
                              );

                              FirebaseAuth.instance
                                  .authStateChanges()
                                  .listen((User? user) {
                                if (user != null) {
                                  busBookingController.addSeatSelectionInfo(
                                      seatSelectionModel, user.uid);
                                  busBookingController
                                      .updateUserSeatSelectionData(
                                          seatSelectionModel, user.uid);
                                }
                              });
                              buttonController.isButtonClicked.value = true;
                              String returnUrl = await DynamicLinkProvider()
                                  .createDynamicLink();
                              print(returnUrl);

                              String tokenID =
                                  await WebhookToken().createWebhookToken();

                              seatSelectionController.tokenID.value = tokenID;

                              var checkoutUrl =
                                  await APIResponseData().getResponseData(
                                seatSelectionController
                                            .selectedBusClass.value ==
                                        busClasses[0]
                                    ? seatSelectionController
                                        .changeEconomySeatPrice()
                                    : seatSelectionController
                                        .changeExecutiveSeatPrice(),
                                returnUrl,
                                tokenID,
                              );

                              var url = Uri.parse(checkoutUrl);

                              await launchUrl(url,
                                      mode: LaunchMode.platformDefault)
                                  .whenComplete(
                                () => buttonController.isButtonClicked.value =
                                    false,
                              );
                            } else {
                              alert("Hey",
                                  "Select atleast one seat to continue!");
                            }
                          },
                          height: size.width * 0.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// final washingtonRef = db.collection("cities").doc("DC");

// // Atomically add a new region to the "regions" array field.
// washingtonRef.update({
//   "regions": FieldValue.arrayUnion(["greater_virginia"]),
// });

// // Atomically remove a region from the "regions" array field.
// washingtonRef.update({
//   "regions": FieldValue.arrayRemove(["east_coast"]),
// });
