import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/divider_widget.dart';
import 'package:luckyman_app/Components/screen_template.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/Models/utils/validators.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/constants/text.dart';
import 'package:luckyman_app/src/features/authentification/controllers/payment_screen_controller.dart';

import 'reservation_details_screen.dart';

class PaymentPage extends StatelessWidget {
  static const String id = '/PaymentScreen';

  PaymentPage({
    super.key,
  }) : super();
  final PaymentController controller = Get.put(PaymentController());

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScreenTemplate(
              decoration: kBackgroundBoxDecoration,
              bottomTextLabel: 'Continue',
              title: 'Make Payment',
              subTitle: '',
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const DividerWidget(title: 'STEPS TO MAKE PAYMENT'),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const BlackTextWidget(
                      text: '''
          1. Enter an active Mobile Money Number and tap "Continue"
          
          2. You'll recieve an OTP Short code. Enter the OTP Short code you recieve in the OTP field.
          
          3. Wait for a short moment to enter your Momo pin when promted in order to complete the payment process.
          
                      ''',
                      fontSize: 12.0,
                    ),
                    Material(
                      child: Form(
                        key: _formkey,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value.isValidPhone) {
                              return "Enter a valid $tMomoNumber";
                            } else {
                              return null;
                            }
                          },
                          controller: controller.momoNumber,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            prefixIcon: Icon(Icons.credit_card_outlined),
                            labelText: tMomoNumber,
                            hintText: tMomoNumber,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
                onPressed: () {
                  Get.to(
                    () => BusTicketScreen(),
                  );
                },
                bottomTextLabel: "CONFIRM PAYMENT"),
          ],
        ),
      ),
    );
  }
}
