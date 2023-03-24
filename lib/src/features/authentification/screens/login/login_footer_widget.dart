import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/authentification/screens/password_reset/password_reset.dart';
import 'package:luckyman_app/src/features/authentification/screens/sign_up/widgets/sign_up_screen.dart';
import 'package:luckyman_app/src/features/core/models/Routes_model/routes2.dart';
import 'package:qlevar_router/qlevar_router.dart';
import '../../../../common_widgets/form/form_footer.dart';
import '../../../../constants/text.dart';

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
            Get.to(() => const SignUpScreen());
            // QR.toName(Routes.signUpPage);
          }),
          redirectText: tSignup,
          onForgotPasswordTap: () {
            Get.to(() => PasswordResetScreen());
            // QR.toName(Routes.forgotPasswordPage);
          },
        )
      ],
    );
  }
}
