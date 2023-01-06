import 'package:angie_notebook/Models/utils/form_items.dart';
import 'package:angie_notebook/Screens/seat_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/dropdown.dart';
import '../Components/input_field.dart';
import '../Components/screen_template.dart';
import '../Components/text_styling.dart';
import '../Constants/constants.dart';
import '../src/common_widgets/buttons/bottom_button.dart';

class BusBookingScreen extends StatefulWidget {
  const BusBookingScreen({Key? key}) : super(key: key);
  static const String id = '/BusBookingScreen';

  @override
  State<BusBookingScreen> createState() => _BusBookingScreenState();
}

class _BusBookingScreenState extends State<BusBookingScreen> {
   String? selectedDestination;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScreenTemplate(
              decoration: kBackgroundBoxDecoration,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
               
              },
              bottomTextLabel: 'Continue to select a seat',
              title: 'Bus Selection',
              subTitle: '',
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const DropdownMenu(
                          items: busType, formLabel: 'Select Bus Type'),
                      DropdownMenu(
                        items: destinations,
                        formLabel: 'Select destination',
                        onChanged: (value) {
                          selectedDestination = value!;
                          print(selectedDestination);
                        },
                      ),
                      const DropdownMenu(
                          items: departureDate,
                          formLabel: 'Select Depature Date'),
                      const DropdownMenu(
                          items: departureTime,
                          formLabel: 'Select Depature Time'),
                      const DropdownMenu(
                          items: pickUpPoints,
                          formLabel: 'Select Pick Up Point'),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Leave blank if you don\'t have any agent',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InputField(
                            labelText: 'Enter Agent\'s Name',
                            widget: BlackTextWidget(
                              text: 'LTL - ',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: BottomButton(
                  onPressed: () {
                    Get.to(
                      () =>  SeatSelectionScreen(
                        selectedDestination:selectedDestination,
                      ),
                    );
                  },
                  bottomTextLabel: 'Contine to select a seat'),
            ),
          ],
        ),
      ),
    );
  }
}
