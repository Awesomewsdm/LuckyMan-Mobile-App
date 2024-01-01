import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/widgets.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/common_widgets/user_info/user_profile_image.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/authentification/screens/login/login_screen.dart';
import 'package:luckyman_app/src/features/core/controllers/profile_controller.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    final Size size = MediaQuery.of(context).size;

    return CirclesBackgroundPage(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                children: [
                  const UserProfileImage(),
                  FutureBuilder(
                    future: profileController.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          UserModel userData = snapshot.data as UserModel;
                          return Text(
                            userData.fullName.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
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
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: kHomeBackgroundBoxDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      // decoration: kHomeBackgroundBoxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LabelTextWidget(
                            text: 'Account Info',
                          ),
                          FutureBuilder(
                              future: profileController.getUserData(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    UserModel userData =
                                        snapshot.data as UserModel;
                                    return Column(children: [
                                      Card(
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.credit_card,
                                            color: Colors.lightBlue[500],
                                          ),
                                          title: Text(
                                              'Student ID: ${userData.studentID}'),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.phone_outlined,
                                            color: Colors.lightBlue[500],
                                          ),
                                          title: Text(
                                              'Mobile Number: ${userData.phoneNumber}'),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.email_outlined,
                                            color: Colors.lightBlue[500],
                                          ),
                                          title:
                                              Text("Email: ${userData.email}"),
                                        ),
                                      ),
                                    ]);
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
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Customer Care',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            color: const Color.fromARGB(250, 250, 250, 250),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.phone_outlined,
                                    color: Colors.lightBlue[500],
                                  ),
                                  title: const Text(tContact1),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.phone_outlined,
                                    color: Colors.lightBlue[500],
                                  ),
                                  title: const Text(tContact2),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.phone_outlined,
                                    color: Colors.lightBlue[500],
                                  ),
                                  title: const Text(tContact3),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                alignment: Alignment.center,
                                side: MaterialStateProperty.all(
                                  const BorderSide(width: 1, color: tLightBlue),
                                ),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(8.0),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.bottomSheet(
                                    isScrollControlled: true,
                                    BottomSheet(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        onClosing: () {},
                                        builder: (context) {
                                          return SizedBox(
                                              height: size.height * 0.75,
                                              child:  const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 8.0,
                                                    left: 10,
                                                    right: 10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      tTermsAndConditions),
                                                    Divider(
                                                      color: tLightBlue,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    LabelTextWidget(
                                                        text:
                                                          tOperationDepartureTitle),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        tOperationDeparture),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    LabelTextWidget(
                                                      text:
                                                          "2. Trip Cancellation",
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                       tTripCancellation ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    LabelTextWidget(
                                                      text:
                                                          "3.	Operation Safety",
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        tOperationSafety),
                                                  ],
                                                ),
                                              ));
                                        }));
                              },
                              child: const Text(
                                tTermsAndConditions,
                                style:
                                    TextStyle(color: tLightBlue, fontSize: 16),
                              ),
                            ),
                          ),
                          BottomButton(
                            icon: const Icon(
                              FontAwesomeIcons.arrowRightLong,
                              color: Colors.white,
                            ),
                            bottomTextLabel: 'Logout',
                            onPressed: () {
                              AuthenticationRepository.instance.logout();
                              // QR.toName(Routes.loginPage);
                              Get.to(
                                () => const LoginScreen(),
                              );
                            },
                            height: MediaQuery.of(context).size.width * 0.15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LabelTextWidget extends StatelessWidget {
  const LabelTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
