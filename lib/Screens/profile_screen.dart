import 'package:angie_notebook/Components/widgets.dart';
import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/src/common_widgets/buttons/bottom_button.dart';
import 'package:angie_notebook/src/constants/text.dart';
import 'package:angie_notebook/src/features/authentification/controllers/profile_controller.dart';
import 'package:angie_notebook/src/features/authentification/models/user_model.dart';
import 'package:angie_notebook/src/features/authentification/screens/login/login_screen.dart';
import 'package:angie_notebook/src/repository/authentification/authentification_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/common_widgets/user_info/user_profile_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return CirclesBackgroundPage(
      child: SafeArea(
        child: FutureBuilder(
          future: profileController.getUserData(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Row(
                        children: const [
                          UserProfileImage(),
                          Text(
                            'Awesome Wisdom',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              Card(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.credit_card,
                                    color: Colors.lightBlue[500],
                                  ),
                                  title:
                                      Text('Student ID: ${userData.studentID}'),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.phone_outlined,
                                    color: Colors.lightBlue[500],
                                  ),
                                  title:
                                       Text('Mobile Number: ${userData.phoneNumber}'),
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
                                  Get.to(() => const LoginScreen());
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
