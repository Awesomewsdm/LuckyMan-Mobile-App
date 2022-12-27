import 'package:angie_notebook/Models/utils/form_items.dart';
import 'package:angie_notebook/Screens/seat_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/dropdown.dart';
import '../Components/screen_template.dart';
import '../Constants/constants.dart';

class BusBookingScreen extends StatefulWidget {
  const BusBookingScreen({Key? key}) : super(key: key);
  static const String id = '/BusBookingScreen';

  @override
  State<BusBookingScreen> createState() => _BusBookingScreenState();
}

class _BusBookingScreenState extends State<BusBookingScreen> {
    String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ScreenTemplate(
        decoration: kBackgroundBoxDecoration,
        onPressed: () {
           if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
          Get.to(
            () => const SeatSelectionScreen(),
          );
        },
        bottomTextLabel: 'Continue to select a seat',
        title: 'Bus Selection',
        subTitle: '',
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Enter Your Full Name.',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 30),
               const DropdownMenu(
                items: destinations,
                formLabel: 'Select your destination',
              ),
               const DropdownMenu(
                items: destinations,
                formLabel: 'Select your destination',
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                 
                },
                child: const Text('Submit Button'),
              ),
            ],
          ),
        ),
      ),
        ),
      ),
    );
  }
}

//  Column( 
//             children: const [
//               DropdownMenu(items: busType, formLabel: 'Select Bus Type'),
//               DropdownMenu(
//                   items: destinations, formLabel: 'Select destination'),
//               DropdownMenu(
//                   items: departureDate, formLabel: 'Select Depature Date'),
//               DropdownMenu(
//                   items: departureTime, formLabel: 'Select Depature Time'),
//               DropdownMenu(
//                   items: pickUpPoints, formLabel: 'Select Pick Up Point'),
//               SizedBox(height: 10.0),
//               Text(
//                 'Leave blank if you don\'t have any agent',
//                 style: TextStyle(
//                     color: Colors.redAccent, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.0),
//               Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: InputField(
//                     labelText: 'Enter Agent\'s Name',
//                     widget: BlackTextWidget(
//                       text: 'LTL - ',
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),