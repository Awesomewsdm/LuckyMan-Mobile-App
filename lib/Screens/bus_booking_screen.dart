import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Models/user_booking_model.dart';
import 'package:luckyman_app/Models/utils/form_items.dart';
import 'package:luckyman_app/Screens/seat_selection_screen.dart';
import 'package:luckyman_app/src/features/authentification/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/authentification/controllers/sign_up_controller.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import '../Components/dropdown.dart';
import '../Components/input_field.dart';
import '../Components/screen_template.dart';
import '../Components/text_styling.dart';
import '../Constants/constants.dart';
import '../src/common_widgets/buttons/bottom_button.dart';

class BusBookingScreen extends StatelessWidget {
  BusBookingScreen({Key? key}) : super(key: key);
  static const String id = '/BusBookingScreen';

  // String? selectedDestination;
  final BusBookingController busBookingController =
      Get.put(BusBookingController());
  final SignUpController signUpController = Get.put(SignUpController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScreenTemplate(
              decoration: kBackgroundBoxDecoration,
              bottomTextLabel: 'Continue to select a seat',
              title: 'Bus Selection',
              subTitle: '',
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      BookingDropdownMenu(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select one option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          busBookingController.selectedBusType.value = value!;
                        },
                        items: busType,
                        formLabel: 'Select Bus Type',
                        dropdownTitle: 'Bus Type',
                      ),
                      BookingDropdownMenu(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select one option';
                          } else {
                            return null;
                          }
                        },
                        items: destinations,
                        formLabel: 'Select destination',
                        onChanged: (value) {
                          busBookingController.selectedDestination.value =
                              value!;
                          // selectedDestination = value!;
                          // print(selectedDestination);
                        },
                        dropdownTitle: 'Destination',
                      ),
                      BookingDropdownMenu(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select one option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          busBookingController.selectedDepatureDate.value =
                              value!;
                        },
                        items: departureDate,
                        formLabel: 'Select Depature Date',
                        dropdownTitle: 'Depature Date',
                      ),
                      BookingDropdownMenu(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select one option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          busBookingController.selectedDepatureTime.value =
                              value!;
                        },
                        items: departureTime,
                        formLabel: 'Select Depature Time',
                        dropdownTitle: 'Depature Time',
                      ),
                      BookingDropdownMenu(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select one option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          busBookingController.selectedPickupPoint.value =
                              value!;
                        },
                        items: pickUpPoints,
                        formLabel: 'Select Pick Up Point',
                        dropdownTitle: 'Pickup Points',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Leave blank if you don\'t have any agent',
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InputField(
                              controller: busBookingController.agentName,
                              labelText: 'Enter Agent\'s Name',
                              widget: const BlackTextWidget(
                                text: 'LTL - ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final UserModel userBookingData = UserModel(
                      destination:
                          busBookingController.selectedDestination.value,
                      depatureDate:
                          busBookingController.selectedDepatureDate.value,
                      depatureTime:
                          busBookingController.selectedDepatureTime.value,
                      pickupPoint:
                          busBookingController.selectedPickupPoint.value);
                  await busBookingController.addBusBookingInfo(userBookingData);
                  _formKey.currentState!.save();
                  Get.to(
                    () => SeatSelectionScreen(
                      selectedDestination:
                          busBookingController.selectedDestination.value,
                    ),
                  );
                }
              },
              bottomTextLabel: 'SELECT YOUR SEAT(S)',
            ),
          ],
        ),
      ),
    );
  }
}
