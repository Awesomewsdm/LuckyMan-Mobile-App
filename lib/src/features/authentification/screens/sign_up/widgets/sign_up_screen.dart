import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widgets/form/form_footer.dart';
import '../../../../../common_widgets/form/form_header.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text.dart';
import 'sign_up_form_widget.dart';
import '../../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeader(
              subtitle: tSignUpSubTitle,
              title: tSignUpTitle,
            ),
            const SignUpFormWidget(),
            FormFooter(
              text: tAlreadyHaveAnAccount,
              onTap: (() {
                Get.to(
                  () => const LoginScreen(),
                );
              }),
              redirectText: tLogin,
            ),
          ],
        ),
      ),
    ));
  }
}
