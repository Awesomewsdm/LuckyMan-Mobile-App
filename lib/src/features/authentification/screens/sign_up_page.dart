import 'package:angie_notebook/src/common_widgets/buttons/bottom_button.dart';
import 'package:angie_notebook/src/constants/sizes.dart';
import 'package:angie_notebook/src/constants/text.dart';
import 'package:angie_notebook/src/features/authentification/models/user_model.dart';
import 'package:angie_notebook/src/features/authentification/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regexed_validator/regexed_validator.dart';

import '../../../common_widgets/form/form_body.dart';
import '../../../common_widgets/form/form_footer.dart';
import '../../../../../../../Components/text_form_field_widget.dart';
import '../../../common_widgets/form/form_header.dart';
import '../controllers/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final controller = Get.put(
    SignUpController(),
  );

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeader(
                  size: size,
                  subtitle: tSignUpSubTitle,
                  title: tSignUpTitle,
                ),
                FormBody(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormFieldWidget(
                      controller: controller.fullName,
                      validator: (value) {
                        if (value == null || !validator.name(value)) {
                          return 'Enter your full name';
                        }
                        return null;
                      },
                      labelText: tFullName,
                      hintText: tFullName,
                      prefixIcon: const Icon(Icons.person_outline_outlined),
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormFieldWidget(
                      controller: controller.studentID,
                      labelText: tStudentID,
                      hintText: tStudentID,
                      prefixIcon: const Icon(Icons.credit_card_outlined),
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormFieldWidget(
                      controller: controller.phoneNo,
                      labelText: tPhoneNo,
                      hintText: tPhoneNo,
                      prefixIcon: const Icon(Icons.call),
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormFieldWidget(
                      controller: controller.email,
                      validator: (value) {
                        if (value == null || validator.email(value)) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                      labelText: tEmail,
                      hintText: tEmail,
                      prefixIcon: const Icon(Icons.email_outlined),
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormFieldWidget(
                      controller: controller.password,
                      hintText: tPassword,
                      labelText: tPassword,
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                      ),
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // TextFormFieldWidget(
                    //   controller: controller.password,
                    //   labelText: tConfirmPassword,
                    //   hintText: tConfirmPassword,
                    //   suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    //   prefixIcon: const Icon(
                    //     Icons.lock_outlined,
                    //   ),
                    //   obscureText: false,
                    // ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BottomButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          SignUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim(),
                          );

                          final UserModel user = UserModel(
                            fullName: controller.fullName.text.trim(),
                            email: controller.email.text.trim(),
                            phoneNumber: controller.phoneNo.text.trim(),
                            password: controller.password.text.trim(),
                            studentID: controller.studentID.text.trim(),
                          );
                          SignUpController.instance.createUser(user);
                          // Get.to(() => const BottomNav());
                        }
                      },
                      bottomTextLabel: tSignup.toUpperCase(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FormFooter(
                      text: tAlreadyHaveAnAccount,
                      onTap: (() {
                        Get.to(
                          () => const LoginScreen(),
                        );
                      }),
                      redirectText: tLogin,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
