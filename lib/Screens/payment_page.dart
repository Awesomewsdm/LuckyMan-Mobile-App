
import 'package:flutter/material.dart';
import 'package:luckyman_app/Components/divider_widget.dart';
import 'package:luckyman_app/Components/input_field.dart';
import 'package:luckyman_app/Components/screen_template.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';

class PaymentPage extends StatelessWidget {
  static const String id = '/PaymentScreen';

  const PaymentPage({
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      decoration: kBackgroundBoxDecoration,
      // onPressed: () {
       
      // },
      bottomTextLabel: 'Continue',
      title: 'Make Payment',
      subTitle: '',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: const [
            SizedBox(
              height: 20.0,
            ),
            DividerWidget(title: 'STEPS TO MAKE PAYMENT'),
            SizedBox(
              height: 15.0,
            ),
            BlackTextWidget(
              text: '''
1. Enter an active Mobile Money Number and tap "Continue"

2. You'll recieve an OTP Short code. Enter the OTP Short code you recieve in the OTP field.

3. Wait for a short moment to enter your Momo pin when promted in order to complete the payment process.

              ''',
              fontSize: 12.0,
            ),
            Material(
              child: InputField(
                labelText: 'Enter your phone number',
                widget: Icon(Icons.search),
                enabledBorderColor: kEnableBorderSideColor,
                focusedBorderColor: kFocusedBorderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
