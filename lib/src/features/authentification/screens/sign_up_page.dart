import 'package:angie_notebook/src/common_widgets/buttons/bottom_button.dart';
import 'package:angie_notebook/Components/image_strings.dart';
import 'package:angie_notebook/Components/sizes.dart';
import 'package:angie_notebook/Components/text.dart';
import 'package:angie_notebook/Components/text_styling.dart';
import 'package:angie_notebook/src/features/authentification/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Components/form_field_widget.dart';
import '../../../../Components/sign_in_redirect.dart';
import '../../../../Components/text_form_field_widget.dart';

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
              Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: const AssetImage(
                    tWelcomeScreenImage,
                  ),
                  height: size.height * 0.25,
                ),
              ),
              const BlackTextWidget(
                text: tSignUpTitle,
                fontSize: 30.0,
              ),
              const Text(tSignUpSubTitle),
              FormFieldWIdget(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    labelText: tFullName,
                    hintText: tFullName,
                    prefixIcon: Icon(Icons.person_outline_outlined),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    labelText: tStudentID,
                    hintText: tStudentID,
                    prefixIcon: Icon(Icons.credit_card_outlined),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    labelText: tPhoneNo,
                    hintText: tPhoneNo,
                    prefixIcon: Icon(Icons.call),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    labelText: tEmail,
                    hintText: tEmail,
                    prefixIcon: Icon(Icons.email_outlined),
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
                    ),
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
                    ),
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
                  SignInRedirect(
                    text: tAlreadyHaveAnAccount,
                    onTap: (() {
                      Get.to(() => const LoginScreen());
                    }), redirectText: tLogin,
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
