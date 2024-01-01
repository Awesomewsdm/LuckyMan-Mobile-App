import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/profile_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/authentification/controllers/sign_up_controller.dart';
import 'package:luckyman_app/src/features/core/screens/all_available_buses.dart';
import '../../../../Components/dropdown.dart';
import '../../../../Components/screen_template.dart';
import '../../../../Constants/constants.dart';
import '../../../common_widgets/buttons/bottom_button.dart';

class BusBookingScreen extends StatefulWidget {
  const BusBookingScreen({Key? key}) : super(key: key);
  static const String id = '/BusBookingScreen';

  @override
  State<BusBookingScreen> createState() => _BusBookingScreenState();
}

class _BusBookingScreenState extends State<BusBookingScreen> {
  // String? selectedDestination;
  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final SignUpController signUpController = Get.put(SignUpController());

  final ButtonController buttonController = Get.put(ButtonController());
  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());

  final profileController = Get.put(ProfileController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenTemplate(
          decoration: kBackgroundBoxDecoration,
          bottomTextLabel: 'Continue to select a seat',
          title: 'Bus Selection',
          subTitle: '',
          child: FutureBuilder(
              future: busBookingController
                  .getBookingDataFromDB("booking-menu-items"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Padding(
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
                                busBookingController.selectedOrigin.value =
                                    value!;
                              },
                              items: snapshot.data!["Origin"],
                              formLabel: 'Select origin',
                              dropdownTitle: 'Origin',
                            ),
                            BookingDropdownMenu(
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select one option';
                                } else {
                                  return null;
                                }
                              },
                              items: snapshot.data!["Destinations"],
                              formLabel: 'Select location',
                              onChanged: (value) {
                                busBookingController.selectedDestination.value =
                                    value!;
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
                                busBookingController
                                    .selectedDepartureDate.value = value!;
                              },
                              items: snapshot.data!["Departure Dates"],
                              formLabel: 'Select Depature Date',
                              dropdownTitle: 'Depature Date',
                            ),
                            BookingDropdownMenu(
                              onChanged: (value) {
                                busBookingController.selectedAgentName.value =
                                    value!;
                              },
                              items: snapshot.data!["Agents"],
                              formLabel: 'Select Your Agent',
                              dropdownTitle: 'LuckyMan Agents',
                            ),
                            SizedBox(
                              height: size.width * 0.3,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  } else {
                    return const Text("Something went wrong");
                  }
                } else {
                  return Expanded(
                    child: SizedBox(
                      height: size.height,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
      bottomSheet: BottomButton(
        icon: const Icon(
          FontAwesomeIcons.arrowRightLong,
          color: Colors.white,
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Get.to(() => AllAvailableBuses(
                  origin: busBookingController.selectedOrigin.value,
                  destination: busBookingController.selectedDestination.value,
                  departureDate:
                      busBookingController.selectedDepartureDate.value,
                ));
            _formKey.currentState!.save();
          }
        },
        bottomTextLabel: "CONTINUE",
        height: size.width * 0.15,
      ),
    );
  }
}

//  BookingDropdownMenu(
//                               validator: (value) {
//                                 if (value == null) {
//                                   return 'Please select one option';
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               onChanged: (value) {
//                                 busBookingController
//                                     .selectedDepatureTime.value = value!;
//                               },
//                               items: snapshot.data!["Departure Times"],
//                               formLabel: 'Select Depature Time',
//                               dropdownTitle: 'Depature Time',
//                             ),
// BookingDropdownMenu(
//                               validator: (value) {
//                                 if (value == null) {
//                                   return 'Please select one option';
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               onChanged: (value) {
//                                 busBookingController.selectedPickupPoint.value =
//                                     value!;
//                               },
//                               items: snapshot.data!["Pickup Points"],
//                               formLabel: 'Select Pick Up Point',
//                               dropdownTitle: 'Pickup Points',
//                             ),

// BookingDropdownMenu(
//                               validator: (value) {
//                                 if (value == null) {
//                                   return 'Please select one option';
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               onChanged: (value) {
//                                 busBookingController.selectedPickupPoint.value =
//                                     value!;
//                               },
//                               items: snapshot.data!["Pickup Points"],
//                               formLabel: 'Select Pick Up Point',
//                               dropdownTitle: 'Pickup Points',
//                             ),

//  BookingDropdownMenu(
//                               validator: (value) {
//                                 if (value == null) {
//                                   return 'Please select one option';
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               onChanged: (value) {
//                                 busBookingController.selectedBusType.value =
//                                     value!;
//                               },
//                               items: busType,
//                               formLabel: 'Select Bus Type',
//                               dropdownTitle: 'Bus Type',
//                             ),