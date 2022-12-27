import 'package:angie_notebook/src/common_widgets/buttons/bottom_button.dart';
import 'package:angie_notebook/src/constants/sizes.dart';
import 'package:angie_notebook/src/constants/text.dart';
import 'package:angie_notebook/src/features/authentification/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regexed_validator/regexed_validator.dart';

import '../../../common_widgets/form/form_body.dart';
import '../../../common_widgets/form/form_footer.dart';
import '../../../../../../../Components/text_form_field_widget.dart';
import '../../../common_widgets/form/form_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
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
                    validator: (value) {
                      if (value == null || !validator.name(value)) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                    labelText: tFullName,
                    hintText: tFullName,
                    prefixIcon: const Icon(Icons.person_outline_outlined), obscureText: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    labelText: tStudentID,
                    hintText: tStudentID,
                    prefixIcon: Icon(Icons.credit_card_outlined), obscureText: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    labelText: tPhoneNo,
                    hintText: tPhoneNo,
                    prefixIcon: Icon(Icons.call), obscureText: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || validator.email(value)) {
                        return 'Please enter a valid passworn';
                      }
                      return null;
                    },
                    labelText: tEmail,
                    hintText: tEmail,
                    prefixIcon: const Icon(Icons.email_outlined), obscureText: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    hintText: tPassword,
                    labelText: tPassword,
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                    ), obscureText: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    labelText: tConfirmPassword,
                    hintText: tConfirmPassword,
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                    ), obscureText: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  BottomButton(
                    onPressed: () {},
                    bottomTextLabel: tSignup.toUpperCase(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormFooter(
                    text: tAlreadyHaveAnAccount,
                    onTap: (() {
                      Get.to(() => const LoginScreen());
                    }),
                    redirectText: tLogin,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
