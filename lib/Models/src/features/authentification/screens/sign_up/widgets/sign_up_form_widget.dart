import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/buttons/progress_state_button.dart';
import 'package:luckyman_app/src/features/authentification/controllers/sign_up_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/models/utils/validators.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../../../../../constants/input_decoration.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text.dart';
import '../../../models/user_model.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final SignUpController signUpController = Get.put(
    SignUpController(),
  );

  final BusBookingController busBookingController =
      Get.put(BusBookingController());
  final ButtonController buttonController = Get.put(ButtonController());

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  ButtonState stateOnlyCustomIndicatorText = ButtonState.idle;

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
                autofillHints: const [AutofillHints.name],
                validator: (value) {
                  if (value!.isEmpty || !validator.name(value.trim())) {
                    return "Please enter a valid name";
                  } else {
                    return null;
                  }
                },
                controller: signUpController.fullName,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tFullName,
                  hintText: tFullName,
                  border: kOutlineInputBorder,
                ),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.isValidPhone) {
                    return "Enter a valid $tStudentID";
                  } else {
                    return null;
                  }
                },
                controller: signUpController.studentID,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  prefixIcon: Icon(Icons.credit_card_outlined),
                  labelText: tStudentID,
                  hintText: tStudentID,
                  border: kOutlineInputBorder,
                ),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                autofillHints: const [AutofillHints.telephoneNumber],
                validator: (value) {
                  if (value!.isEmpty || value.isValidPhone) {
                    return "Enter a valid phone number";
                  } else {
                    return null;
                  }
                },
                controller: signUpController.phoneNo,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  prefixIcon: Icon(Icons.call),
                  labelText: tPhoneNo,
                  hintText: tPhoneNo,
                  border: kOutlineInputBorder,
                ),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                autofillHints: const [AutofillHints.email],
                validator: (value) {
                  if (value!.isEmpty || !validator.email(value.trim())) {
                    return "Please enter a valid email address";
                  } else {
                    return null;
                  }
                },
                controller: signUpController.email,
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
                  obscureText: signUpController.passwordVisible.value,
                  validator: (value) {
                    if (value!.isEmpty || value.isValidPassword) {
                      return "Please enter a valid password";
                    } else {
                      return null;
                    }
                  },
                  controller: signUpController.password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(signUpController.passwordVisible.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        signUpController.passwordVisible.value =
                            !signUpController.passwordVisible.value;
                      },
                    ),
                    labelText: tPassword,
                    hintText: tPassword,
                    border: kOutlineInputBorder,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ), //
               SizedBox(
              width: double.infinity,
              child: ProgressStateButton(
                onPressedCustomIndicatorButton: () async {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      stateOnlyCustomIndicatorText = ButtonState.loading;
                    });
                    buttonController.isButtonClicked.value == true;

                     _formkey.currentState!.save();
                      final UserModel userData = UserModel(
                        fullName: signUpController.fullName.text.trim(),
                        email: signUpController.email.text.trim(),
                        phoneNumber: signUpController.phoneNo.text.trim(),
                        password: signUpController.password.text.trim(),
                        studentID: signUpController.studentID.text.trim(),
                        isUserBooked: false,
                      );

                      await signUpController.registerUser(
                        signUpController.email.text.trim(),
                        signUpController.password.text.trim(),
                      );

                      final FirebaseAuth auth = FirebaseAuth.instance;
                      var user = auth.currentUser!;
                      var userID = user.uid;

                      signUpController
                          .createUser(userData, userID)
                         
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
              ).buildCustomProgressIndicatorButton("Sign-Up"),
            ),
             
            ],
          ),
        ),
      );
  }
}
