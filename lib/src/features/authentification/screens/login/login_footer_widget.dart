import 'package:flutter/material.dart';
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
            QR.toName(Routes.signUpPage);
          }),
          redirectText: tSignup,
          onForgotPasswordTap: () {
            QR.toName(Routes.forgotPasswordPage);
          },
        )
      ],
    );
  }
}
