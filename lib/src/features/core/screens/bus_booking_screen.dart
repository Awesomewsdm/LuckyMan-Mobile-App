import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/dropdown.dart';
import 'package:luckyman_app/Components/input_field.dart';
import 'package:luckyman_app/Components/screen_template.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/sign_up_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/user_booking_model.dart';
import 'package:luckyman_app/src/features/core/models/utils/form_items.dart';

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

  final _formKey = GlobalKey<FormState>();

  Future<DocumentSnapshot<Map<String, dynamic>>>? _fetchData;

  Future<DocumentSnapshot<Map<String, dynamic>>> getBookingMenuItems(
      String docID) async {
    return await FirebaseFirestore.instance
        .collection("Booking Data")
        .doc(docID)
        .get();
  }

  @override
  void initState() {
    super.initState();
    _fetchData = getBookingMenuItems("booking-menu-items");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: _fetchData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ScreenTemplate(
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
                                    busBookingController.selectedBusType.value =
                                        value!;
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
                                        .selectedDepatureDate.value = value!;
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
                                        .selectedDepatureTime.value = value!;
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
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else {
                      return const Text("Somthing went wrong");
                    }
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
            BottomButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
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
                  );

                  FirebaseAuth.instance
                      .authStateChanges()
                      .listen((User? user) async {
                    if (user != null) {
                      await busBookingController.addBusBookingInfo(
                          userBookingModel, user.uid);
                      await busBookingController.updateUserBookingData(userBookingModel, user.uid);
                    }
                  });
                  _formKey.currentState!.save();
                }
              },
              bottomTextLabel: 'SELECT YOUR SEAT(S)',
              height: MediaQuery.of(context).size.width * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
