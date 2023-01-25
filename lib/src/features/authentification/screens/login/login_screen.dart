
import 'package:flutter/material.dart';
import 'package:luckyman_app/src/common_widgets/form/form_header.dart';
import 'package:luckyman_app/src/constants/sizes.dart';
import 'package:luckyman_app/src/constants/text.dart';

import 'login_footer_widget.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const FormHeader(
              
                title: tLoginTitle,
                subtitle: tLoginSubTitle,
              ),
              LoginFormWidget(),
              const SizedBox(
                height: 20.0,
              ),
              const LoginFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
