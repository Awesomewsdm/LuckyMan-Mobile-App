import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/dropdown.dart';
import 'package:luckyman_app/Components/input_field.dart';
import 'package:luckyman_app/Components/screen_template.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/profile_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/sign_up_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/user_booking_model.dart';
import 'package:luckyman_app/src/features/core/models/utils/form_items.dart';

class BusBookingScreen extends StatelessWidget {
  BusBookingScreen({Key? key}) : super(key: key);
  static const String id = '/BusBookingScreen';

  // String? selectedDestination;
  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final SignUpController signUpController = Get.put(SignUpController());

  final ButtonController buttonController = Get.put(ButtonController());

  final profileController = Get.put(ProfileController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
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
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height: size.height * 0.8,
                                width: size.width * 0.85,
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
                                        busBookingController
                                            .selectedSchool.value = value!;
                                      },
                                      items: snapshot.data!["Tertiary Schools"],
                                      formLabel: 'Select institution',
                                      dropdownTitle: 'Institution',
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
                                      formLabel: 'Select destination',
                                      onChanged: (value) {
                                        busBookingController
                                            .selectedDestination.value = value!;
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
                                            .selectedBusType.value = value!;
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
                                      onChanged: (value) {
                                        busBookingController
                                            .selectedDepatureDate
                                            .value = value!;
                                      },
                                      items: snapshot.data!["Departure Dates"],
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
                                        busBookingController
                                            .selectedDepatureTime
                                            .value = value!;
                                      },
                                      items: snapshot.data!["Departure Times"],
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
                                        busBookingController
                                            .selectedPickupPoint.value = value!;
                                      },
                                      items: snapshot.data!["Pickup Points"],
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
                                            controller:
                                                busBookingController.agentName,
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
          BottomButton(
            loadingIcon: Obx(
              () => SizedBox(
                child: buttonController.isButtonClicked.value == true
                    ? const CircularProgressIndicator(color: tWhiteColor)
                    : const Text(""),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                print(busBookingController.selectedDestination.value);
                buttonController.isButtonClicked.value == true;
                var getData = await profileController.getUserData();

                UserModel userData = getData as UserModel;

                String userName = userData.fullName.toString();

                final UserBookingModel userBookingModel = UserBookingModel(
                  selectedDestination:
                      busBookingController.selectedDestination.value,
                  selectedPickupPoint:
                      busBookingController.selectedPickupPoint.value,
                  selectedBusType: busBookingController.selectedBusType.value,
                  selectedDepatureTime:
                      busBookingController.selectedDepatureTime.value,
                  agentName: busBookingController.agentName.text,
                  selectedDepatureDate:
                      busBookingController.selectedDepatureDate.value,
                  userName: userName,
                );

                FirebaseAuth.instance
                    .authStateChanges()
                    .listen((User? user) async {
                  if (user != null) {
                    await busBookingController.addBusBookingInfo(
                        userBookingModel, user.uid);
                    // await busBookingController.updateUserBookingData(
                    //     userBookingModel, user.uid);
                  }
                });
                buttonController.isButtonClicked.value == false;
                _formKey.currentState!.save();
              }
            },
            bottomTextLabel: 'SELECT YOUR SEAT(S)',
            height: size.width * 0.15,
          ),
        ],
      ),
    );
  }
}
