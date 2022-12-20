import 'package:angie_notebook/Components/bottom_button.dart';
import 'package:angie_notebook/Components/list_of_seats.dart';
import 'package:angie_notebook/Components/text_styling.dart';
import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/Models/economy_seats.dart';
import 'package:angie_notebook/Models/economy_seat_layout.dart';
import 'package:flutter/material.dart';

import '../Components/dropdown.dart';
import '../Models/menu_items.dart';

class SeatSelectionScreen extends StatelessWidget {
  const SeatSelectionScreen({
    Key? key,
  }) : super(key: key);
  static String id = '/SeatSelectionScreen';

  // final List<int> economySeats = [1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31];

  // Widget _buildSeats(int index) {
  //   return Seats(
  //     boxColor: Colors.white,
  //     borderColor: const Color.fromRGBO(251, 199, 32, 1.0),
  //     // icon: Text('$index'),
  //     seatNumber: index,
  //   );
  // }

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
      body: SafeArea(
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
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 35,
                child: const DropdownMenu(
                    items: busClasses,
                    buttonWidth: double.maxFinite,
                    formLabel: 'Select Bus Class'),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - 50,
                    // color: const Color.fromRGBO(255, 255, 255, 1.0),
                    decoration: kBackgroundBoxDecoration,
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: SizedBox(
                      child: EconomySeatLayout(model: economyseatLayout),
                    ),
                  ),
                ),
              ),
            ],
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
                      children: const [
                        AshTextWidget(text: 'Selected Seat'),
                        Text(
                          '01, 02, 34, 01, 09 ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
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