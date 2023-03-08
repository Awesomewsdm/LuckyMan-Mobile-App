import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/authentification/screens/password_reset/password_reset.dart';

import '../../../../common_widgets/form/form_footer.dart';
import '../../../../constants/text.dart';
import '../sign_up/widgets/sign_up_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormFooter(
          text: tDontHaveAnAccount,
          onSignUpTap: (() {
            Get.to(
              () => const SignUpScreen(),
            );
          }),
          redirectText: tSignup,
          onForgotPasswordTap: () {
            Get.to(() => PasswordResetScreen());
          },
        )
      ],
    );
  }
}
