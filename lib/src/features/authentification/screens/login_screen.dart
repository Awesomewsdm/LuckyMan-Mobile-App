import 'package:angie_notebook/src/common_widgets/form/form_header.dart';
import 'package:angie_notebook/src/common_widgets/form/form_footer.dart';
import 'package:angie_notebook/src/constants/sizes.dart';
import 'package:angie_notebook/src/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widgets/form/form_body.dart';
import '../../../../Components/text_form_field_widget.dart';
import 'sign_up_page.dart';
import 'package:regexed_validator/regexed_validator.dart';

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
              FormHeader(
                size: size,
                title: tLoginTitle,
                subtitle: tLoginSubTitle,
              ),
              FormBody(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldWidget(
                    labelText: tEmail,
                    hintText: tEmail,
                    validator: (value) {
                      if (value == null || !validator.email(value)) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.person_outline_outlined),
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldWidget(
                    obscureText: true,
                    hintText: tPassword,
                    labelText: tPassword,
                    validator: (value) {
                      if (value == null || !validator.password(value)) {
                        return 'Enter a valid password';
                      }
                      return null;
                    },
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    prefixIcon: const Icon(
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
                  FormFooter(
                    text: tDontHaveAnAccount,
                    onTap: (() {
                      Get.to(
                        () =>  SignUpScreen(),
                      );
                    }),
                    redirectText: tSignup,
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
