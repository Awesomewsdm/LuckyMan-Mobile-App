import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/seat_status.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/Models/utils/economy_seats.dart';
import 'package:luckyman_app/Models/utils/executive_seat_layout_model.dart';
import 'package:luckyman_app/src/common_widgets/app_bar/primary_app_bar.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/common_widgets/seat_layout_builder/seat_layout_builder.dart';
import 'package:luckyman_app/src/constants/alert.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/constants/custom_icons_icons.dart';
import 'package:luckyman_app/src/constants/sizes.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/core/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({
    Key? key,
    this.busSnapshot,
  }) : super(key: key);
  static String id = '/SeatSelectionScreen';

  // -- Controllers

  final DocumentSnapshot? busSnapshot;

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    // void bookSeats() async {
    //   final Map<String, dynamic> bus =
    //       widget.busSnapshot!.data() as Map<String, dynamic>;

    //   final updatedData = {
    //     'bookedSeats': [
    //       ...bus['bookedSeats'] as List<dynamic>,
    //       ...selectedSeats
    //     ]
    //   };
    //   busBookingController.busSeatsList.value =
    //       bus['bookedSeats'] as List<dynamic>;
    //   busBookingController.reference.value = widget.busSnapshot!.reference.id;

    //   await widget.busSnapshot!.reference.update(updatedData);

    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Seats booked successfully'),
    //     ),
    //   );
    // }

    final SeatSelectionController seatSelectionController =
        Get.put(SeatSelectionController());

    final Size size = MediaQuery.of(context).size;

    final Map<String, dynamic> bus =
        widget.busSnapshot!.data() as Map<String, dynamic>;

    var ticketPriceFromDB = bus["ticketPrice"];

    var ticketPrice = ticketPriceFromDB.toDouble();

    final bookedSeats = bus['bookedSeats'] as List<dynamic>;
    final destination = bus["destination"] as String;
    final busClass = bus["busClass"] as String;

    final ButtonController buttonController = Get.put(ButtonController());
    return Scaffold(
      appBar: PrimaryAppBar(title: tSeatSelectionScreenTitle, onPressed: () {})
          .getPrimaryAppBar(),
      backgroundColor: backgroundColor5,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                height: 10.0,
              ),
              Container(
                height: size.height,
                width: size.width - 50,
                decoration: kBackgroundBoxDecoration,
                child: SeatLayoutBuilder(
                  model: busClass == "ECONOMY"
                      ? economyseatLayout
                      : executiveseatLayout,
                  seatSelectionController: seatSelectionController,
                  destination: destination,
                  selectedSeatList: seatSelectionController.userSelectedSeats,
                  amount: seatSelectionController.seatPrice,
                  busClass: busClass,
                  bookedSeatsFromDB: bookedSeats,
                  ticketPrice: ticketPrice,
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomSheet: Container(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(CustomIcons.airlineSeatReclineExtra,
                              size: 25.0, color: tBlueColor),
                          SizedBox(
                            width: 6.0,
                          ),
                          AshTextWidget(text: 'Selected Seat'),
                        ],
                      ),
                      Obx(
                        () => Text(
                          seatSelectionController.userSelectedSeats.join(" , "),
                          style: TextStyle(
                            color: selectedSeatColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Icon(FontAwesomeIcons.moneyBill,
                              size: 18.0, color: tBlueColor),
                          SizedBox(
                            width: 10.0,
                          ),
                          AshTextWidget(text: 'Total Price'),
                        ],
                      ),
                      Obx(
                        () => Text(
                          'GH¢${seatSelectionController.seatPrice.value}',
                          style: TextStyle(
                            color: selectedSeatColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BottomButton(
                icon: const Icon(
                  FontAwesomeIcons.arrowRightLong,
                  color: Colors.white,
                ),
                bottomTextLabel: 'PROCEED TO PAYMENT',
                loadingIcon: Obx(
                  () => SizedBox(
                    child: buttonController.isButtonClicked.value == true
                        ? const CircularProgressIndicator(color: tWhiteColor)
                        : const Text(""),
                  ),
                ),
                onPressed: () {
                  if (seatSelectionController.isSeatSelected.value == true) {
                    buttonController.isButtonClicked.value = true;

                    var totalSeatPrice =
                        seatSelectionController.seatPrice.value;

                    showAlertDialog(size, totalSeatPrice);
                  } else {
                    alert("Hey", "Select atleast one seat to continue!");
                  }
                },
                height: size.width * 0.15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<SeatSelectionController>();
    seatSelectionController.dispose();
    super.dispose();
  }
}
