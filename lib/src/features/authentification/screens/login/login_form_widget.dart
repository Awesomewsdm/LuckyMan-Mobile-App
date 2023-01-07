import 'package:angie_notebook/Models/utils/validators.dart';
import 'package:angie_notebook/src/features/authentification/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/bottom_nav/bottom_nav.dart';
import '../../../../constants/input_decoration.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({
    Key? key,
  }) : super(key: key);
  final LoginController controller = Get.put(LoginController());
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: tFormHeight - 10,
      ),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              validator: (value) {
                if (value != null || value!.isValidEmail) {
                  return "Please enter a valid email address";
                } else {
                  return null;
                }
              },
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                prefixIcon: Icon(Icons.email_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: kOutlineInputBorder,
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || value.isValidPassword) {
                  return "Enter a valid password";
                } else {
                  return null;
                }
              },
              controller: controller.password,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                prefixIcon: Icon(Icons.lock_outline_rounded),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                labelText: tPassword,
                hintText: tPassword,
                border: kOutlineInputBorder,
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    LoginController.instance.signInUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );
                    Get.to(
                      () => const BottomNav(),
                    );
                  }
                },
                child: Text(
                  tLogin.toUpperCase(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
