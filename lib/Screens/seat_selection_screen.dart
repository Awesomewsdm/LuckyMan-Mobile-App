import 'package:angie_notebook/Components/bottom_button.dart';
import 'package:angie_notebook/Components/list_of_seats.dart';
import 'package:angie_notebook/Components/text_styling.dart';
import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/Models/economy_seat_layout.dart';
import 'package:angie_notebook/Models/economy_seats.dart';
import 'package:angie_notebook/Models/executive_seat_layout_model.dart';
import 'package:angie_notebook/Models/executive_seats_layout.dart';
import 'package:angie_notebook/controllers/seat_selection_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/widgets.dart';
import '../Models/menu_items.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({
    Key? key,
  }) : super(key: key);
  static String id = '/SeatSelectionScreen';

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  // final List<int> economySeats = [1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31];
  String selectedValue = 'ECONOMY';
  @override
  Widget build(BuildContext context) {
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
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
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
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
                      setState(() {
                        selectedValue = value!;
                        // ignore: avoid_print
                        print(selectedValue);
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
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 50,
                      // color: const Color.fromRGBO(255, 255, 255, 1.0),
                      decoration: kBackgroundBoxDecoration,
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 300),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width - 50,
                        // color: const Color.fromRGBO(255, 255, 255, 1.0),
                        decoration: kBackgroundBoxDecoration,
                        child: selectedValue == busClasses[0]
                            ? EconomySeatLayout(
                                model: economyseatLayout,
                              )
                            : ExecutiveSeatLayout(
                                model: executiveseatLayout,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 120.0,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15.0),
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
            Container(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AshTextWidget(text: 'Selected Seat'),
                        Obx(
                          () => Text(
                            SeatSelectionController.instance.selectedSeats
                                .join(' , '),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ]),
                  const VerticalDivider(
                    // indent: 20.0,
                    // endIndent: 20.0,
                    // thickness: 1.0,
                    color: Color(0xFFFFCA40),
                  ),
                  Column(
                    children: const [
                      AshTextWidget(text: 'Total Price'),
                      Text(
                        'GH¢1000',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
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
                  Navigator.pushNamed(context, '/PaymentScreen');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//  ListView(
//                     scrollDirection: Axis.vertical,
//                     children: [
//                       Column(
//                         children: economySeats
//                             .map(
//                               (item) => _buildSeats(item),
//                             )
//                             .toList(),
//                       ),
//                     ],
//                   ),