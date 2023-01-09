import 'package:angie_notebook/src/features/authentification/controllers/seat_selection_controller.dart';
import 'package:angie_notebook/src/common_widgets/buttons/bottom_button.dart';
import 'package:angie_notebook/Components/text_styling.dart';
import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/Screens/payment_page.dart';
import 'package:angie_notebook/src/repository/authentification/user_booking.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/seat_status.dart';
import '../Components/widgets.dart';
import '../Models/utils/form_items.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({
    this.selectedDestination,
    Key? key,
  }) : super(key: key);
  static String id = '/SeatSelectionScreen';
  final String? selectedDestination;

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  String selectedValue = 'ECONOMY';
  RxDouble amount = 0.0.obs;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
      body: CirclesBackgroundPage(
        child: SafeArea(
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
              Container(
                width: size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select Bus Class',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 45,
                  buttonPadding: const EdgeInsets.only(left: 10, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  items: busClasses
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {}
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.

                    // seatSelectionController
                    //     .selectedDropdownMenuItem = value!;
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  onSaved: (value) {
                    // selectedValue = value.toString();
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height,
                    width: size.width - 50,
                    // color: const Color.fromRGBO(255, 255, 255, 1.0),
                    decoration: kBackgroundBoxDecoration,
                    child: selectedValue == busClasses[0]
                        ? UserBooking(widget.selectedDestination)
                            .changeEconomySeatsLayout()
                        : UserBooking(widget.selectedDestination)
                            .changeExecutiveSeatsLayout(),
                  ),
                ),
              ),
            ],
          ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AshTextWidget(text: 'Selected Seat'),
                        selectedValue == busClasses[0]
                            ? UserBooking(widget.selectedDestination)
                                .changeEconomySeatList()
                            : UserBooking(widget.selectedDestination)
                                .changeExecutiveSeatList(),
                      ],
                    ),
                    Column(
                      children: [
                        const AshTextWidget(text: 'Total Price'),
                        Obx(
                          () => Text(
                            'GH¢${seatSelectionController.pAcrraseatPrice.value}',
                            style: const TextStyle(
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
                  bottomTextLabel: 'Proceed to make payment',
                  onPressed: () {
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
