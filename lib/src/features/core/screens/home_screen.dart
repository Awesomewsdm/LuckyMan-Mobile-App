import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/user_info/user_profile_image.dart';
import 'package:luckyman_app/src/constants/image_strings.dart';
import 'package:luckyman_app/src/features/core/controllers/profile_controller.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/features/core/models/Routes_model/routes2.dart';
import 'package:luckyman_app/src/features/core/screens/bus_booking_screen.dart';
import 'package:qlevar_router/qlevar_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/HomeScreen';
  getCurrentUserID() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final myUid = user!.uid;
    return myUid;
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              'Home',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height,
              decoration: kHomeBackgroundBoxDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AshTextWidget(
                              text: 'Welcome',
                              fontSize: 18,
                            ),
                            FutureBuilder(
                              future: profileController.getUserData(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    UserModel userData =
                                        snapshot.data as UserModel;
                                    return BlackTextWidget(
                                      text: userData.fullName.toString(),
                                      fontSize: 25,
                                      color: Colors.lightBlue,
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
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const UserProfileImage(
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const BlackTextWidget(
                    text: 'What would you like to do?',
                    fontSize: 20,
                  ),
                  Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                        crossAxisCount: 2,
                      ),
                      children: [
                        HomeWidget(
                          imageLink: tBusIcon,
                          label: 'Book Bus Ticket',
                          onTap: () {
                            // QR.toName(Routes.busSelectionPage);
                            Get.to(() => BusBookingScreen());
                          },
                        ),
                        HomeWidget(
                          imageLink: tTourIcon,
                          label: 'Go On Tour',
                          onTap: () {
                            // Get.to(() =>const  Home());

                            // QR.toName(Routes.seatSelectionPage);
                          },
                        ),
                        HomeWidget(
                          imageLink: tLuggagesIcon,
                          label: 'Luggage Storage',
                          onTap: () {},
                        ),
                        HomeWidget(
                          imageLink: tLuggageTransport,
                          label: 'Luggage Transportation',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
    required this.label,
    required this.imageLink,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final String imageLink;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 80.0,
        width: 80.0,
        decoration: kSeatScreenBoxDecoration,
        duration: const Duration(seconds: 200),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: AssetImage(imageLink),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
