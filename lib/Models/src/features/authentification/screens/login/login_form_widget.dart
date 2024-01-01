import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/buttons/progress_state_button.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/models/utils/validators.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../../../../constants/input_decoration.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text.dart';
import '../../controllers/login_controller.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final LoginController loginController = Get.put(LoginController());

  final _formkey = GlobalKey<FormState>();

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final ButtonController buttonController = Get.put(ButtonController());

  ButtonState stateOnlyCustomIndicatorText = ButtonState.idle;

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
              child: ProgressStateButton(
                onPressedCustomIndicatorButton: () async {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      stateOnlyCustomIndicatorText = ButtonState.loading;
                    });
                    buttonController.isButtonClicked.value == true;

                    await LoginController.instance
                        .signInUser(
                      loginController.email.text.trim(),
                      loginController.password.text.trim(),
                    )
                        .whenComplete(() {
                      setState(() {
                        stateOnlyCustomIndicatorText = ButtonState.success;
                      });
                    });
                  } else {
                    setState(() {
                      stateOnlyCustomIndicatorText = ButtonState.fail;
                    });
                  }
                },
                stateOnlyCustomIndicatorText: stateOnlyCustomIndicatorText,
              ).buildCustomProgressIndicatorButton("Login"),
            )
          ],
        ),
      ),
    );
  }
}
