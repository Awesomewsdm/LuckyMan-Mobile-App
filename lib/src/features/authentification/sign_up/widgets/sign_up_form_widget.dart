
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Models/utils/validators.dart';
import 'package:luckyman_app/Screens/home.dart';
import 'package:regexed_validator/regexed_validator.dart';

import '../../../../constants/input_decoration.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text.dart';
import '../../controllers/sign_up_controller.dart';
import '../../models/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(
    SignUpController(),
  );

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
              autofillHints: const [AutofillHints.name],
              validator: (value) {
                if (value!.isEmpty || !validator.name(value.trim())) {
                  return "Please enter a valid name";
                } else {
                  return null;
                }
              },
              controller: controller.fullName,
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
              controller: controller.studentID,
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
              controller: controller.phoneNo,
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
            Obx(
              () => TextFormField(
                autofillHints: const [AutofillHints.newPassword],
                obscureText: controller.passwordVisible.value,
                validator: (value) {
                  if (value!.isEmpty || value.isValidPassword) {
                    return "Please enter a valid password";
                  } else {
                    return null;
                  }
                },
                controller: controller.password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(controller.passwordVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onPressed: () {
                      controller.passwordVisible.value =
                          !controller.passwordVisible.value;
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
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    final UserModel user = UserModel(
                      fullName: controller.fullName.text.trim(),
                      email: controller.email.text.trim(),
                      phoneNumber: controller.phoneNo.text.trim(),
                      password: controller.password.text.trim(),
                      studentID: controller.studentID.text.trim(),
                    );
                    SignUpController.instance.createUser(user);
                    SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );

                    _formkey.currentState!.save();
                    Get.to(() =>  Home());
                    _formkey.currentState!.reset();
                  }
                },
                child: Text(
                  tSignup.toUpperCase(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
