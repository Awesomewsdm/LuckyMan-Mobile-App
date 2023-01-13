
import 'package:flutter/material.dart';

import '../Components/divider_widget.dart';
import '../Components/screen_template.dart';
import '../Components/text_styling.dart';
import '../Constants/constants.dart';

class BusTicketScreen extends StatelessWidget {
  const BusTicketScreen({Key? key}) : super(key: key);
  static const String id = '/BusTicketScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenTemplate(
          decoration: kBackgroundBoxDecoration,
          // onPressed: () {
            
              
          //      Get.to(() => const BusBookingScreen());
          
          // },
          bottomTextLabel: 'Download Ticket',
          title: 'Your Ticket',
          subTitle: 'Show this ticket to the conductor at the bus terminal',
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  decoration: kSeatScreenBoxDecoration,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          AshTextWidget(
                            text: 'NAME:',
                          ),
                          BlackTextWidget(
                            text: 'Wisdom',
                            fontSize: 18.0,
                          ),
                          BlackTextWidget(
                            text: 'KORDAH',
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        color: Color(0xFFFFCA40),
                      ),
                      Column(
                        children: const [
                          Text(
                            'SEAT NO:',
                            style: TextStyle(
                              color: Color(0xFFD8D8D8),
                            ),
                          ),
                          Text(
                            '001',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 30.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              AshTextWidget(text: 'TYPE'),
                              BlackTextWidget(text: 'VIP'),
                            ],
                          ),
                          Column(
                            children: const [
                              AshTextWidget(text: 'LOCATION'),
                              BlackTextWidget(text: 'KNUST'),
                            ],
                          ),
                          Column(
                            children: const [
                              AshTextWidget(text: 'DESTINATION'),
                              BlackTextWidget(text: 'Koforidua'),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              AshTextWidget(text: 'PICKUP POINT'),
                              BlackTextWidget(text: 'Royal Parade Grounds'),
                            ],
                          ),
                          Column(
                            children: const [
                              AshTextWidget(text: 'CLASS'),
                              BlackTextWidget(text: 'Executive'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const DividerWidget(
                        title: 'TIME',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              AshTextWidget(text: 'BOARDING'),
                              BlackTextWidget(text: '8:00AM'),
                            ],
                          ),
                          Column(
                            children: const [
                              AshTextWidget(text: 'DEPARTURE'),
                              BlackTextWidget(text: '12/06/2022'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const DividerWidget(
                        title: 'TRANSACTION',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              AshTextWidget(text: 'AMOUNT PAID'),
                              BlackTextWidget(text: 'GH¢120'),
                            ],
                          ),
                          Column(
                            children: const [
                              AshTextWidget(text: 'DATE PAID'),
                              BlackTextWidget(text: '12/06/2022')
                            ],
                          ),
                        ],
                      ),
                    ]),
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
