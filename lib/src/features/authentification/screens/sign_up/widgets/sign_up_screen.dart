import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/authentification/screens/sign_up/widgets/sign_up_footer.dart';
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
              SignUpFormFooter(
                text: tAlreadyHaveAnAccount,
                redirectText: tLogin,
                onSignUpTap: () {
                  Get.to(
                    () => const LoginScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
