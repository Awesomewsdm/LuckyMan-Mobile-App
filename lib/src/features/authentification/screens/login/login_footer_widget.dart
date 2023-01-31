import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          onTap: (() {
            Get.to(
              () => const SignUpScreen(),
            );
          }),
          redirectText: tSignup,
        )
      ],
    );
  }
}
