import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/common_widgets/form/form_header.dart';
import 'package:luckyman_app/src/constants/input_decoration.dart';
import 'package:luckyman_app/src/constants/sizes.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/sign_up_controller.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';
import 'package:regexed_validator/regexed_validator.dart';

class PasswordResetScreen extends StatelessWidget {
  static String id = '/PasswordResetScreen';

  PasswordResetScreen({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.put(
    SignUpController(),
  );

  final _formkey = GlobalKey<FormState>();
  final AuthenticationRepository authenticationRepository = Get.put(
    AuthenticationRepository(),
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: tFormHeight - 20,
              ),
              const FormHeader(
                subtitle: tForgetMailSubTitle,
                title: tForgetPasswordTitle,
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
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: BottomButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await authenticationRepository
                          .resetUserPassword(signUpController.email.text.trim())
                          .whenComplete(
                            () => Get.defaultDialog(
                              title: "Yep Yep !",
                              middleText:
                                  "A password reset link has been sent to your email ${signUpController.email.text}",
                              backgroundColor: Colors.lightBlue,
                              titleStyle: const TextStyle(color: Colors.white),
                              middleTextStyle:
                                  const TextStyle(color: Colors.white),
                              radius: 10,
                              confirm: SizedBox(
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  onPressed: () {},
                                  child: const Text('Ok, let me check my mail'),
                                ),
                              ),
                            ),
                          );
                    }
                  },
                  bottomTextLabel: 'Send Email',
                  height: size.width * 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
