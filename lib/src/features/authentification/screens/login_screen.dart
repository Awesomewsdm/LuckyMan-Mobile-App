import 'package:angie_notebook/Components/image_strings.dart';
import 'package:angie_notebook/Components/sign_in_redirect.dart';
import 'package:angie_notebook/Components/sizes.dart';
import 'package:angie_notebook/Components/text.dart';
import 'package:angie_notebook/Components/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Components/form_field_widget.dart';
import '../../../../Components/text_form_field_widget.dart';
import 'sign_up_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  height: size.height * 0.3,
                ),
              ),
              const BlackTextWidget(
                text: tLoginTitle,
                fontSize: 30.0,
              ),
              const Text(tLoginSubTitle),
              FormFieldWIdget(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFormFieldWidget(
                    labelText: tEmail,
                    hintText: tEmail,
                    prefixIcon: Icon(Icons.person_outline_outlined),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(tForgetPassword),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          tLogin.toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SignInRedirect(
                    text: tDontHaveAnAccount,
                    onTap: (() {
                      Get.to(
                        () => const SignUpScreen(),
                      );
                    }), redirectText: tSignup,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
