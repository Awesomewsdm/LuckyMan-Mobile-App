import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/login_controller.dart';
import 'package:luckyman_app/src/features/core/models/utils/validators.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../../../../constants/input_decoration.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({
    Key? key,
  }) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
  final _formkey = GlobalKey<FormState>();

  final BusBookingController busBookingController =
      Get.put(BusBookingController());
  final ButtonController buttonController = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                if (value!.isEmpty || !validator.email(value.trim())) {
                  return "Please enter a valid email address";
                } else {
                  return null;
                }
              },
              autofillHints: const [AutofillHints.email],
              controller: loginController.email,
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
            Obx(
              () => TextFormField(
                autofillHints: const [AutofillHints.newPassword],
                obscureText: loginController.passwordVisible.value,
                validator: (value) {
                  if (value!.isEmpty || value.isValidPassword) {
                    return "Please enter a valid password";
                  } else {
                    return null;
                  }
                },
                controller: loginController.password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(loginController.passwordVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onPressed: () {
                      loginController.passwordVisible.value =
                          !loginController.passwordVisible.value;
                    },
                  ),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: kOutlineInputBorder,
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: BottomButton(
                loadingIcon: Obx(() => SizedBox(
                      child: buttonController.isButtonClicked.value == true
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(""),
                    )),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    buttonController.isButtonClicked.value == true;

                    await LoginController.instance
                        .signInUser(
                      loginController.email.text.trim(),
                      loginController.password.text.trim(),
                    )
                        .whenComplete(() {
                      _formkey.currentState!.reset();
                    });
                  }
                },
                bottomTextLabel: tLogin.toUpperCase(),
                height: size.width * 0.1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
