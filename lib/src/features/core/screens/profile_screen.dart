import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/widgets.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/common_widgets/user_info/user_profile_image.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/profile_controller.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/features/authentification/screens/login/login_screen.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return CirclesBackgroundPage(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
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
                          return const Text("Somthing went wrong");
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account Info',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FutureBuilder(
                          future: profileController.getUserData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                UserModel userData = snapshot.data as UserModel;
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
                                      title: Text("Email: ${userData.email}"),
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
                                return const Text("Somthing went wrong");
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
                      BottomButton(
                        bottomTextLabel: 'Logout',
                        onPressed: () {
                          AuthenticationRepository.instance.logout();
                          Get.offAll(
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
          ],
        ),
      ),
    );
  }
}
