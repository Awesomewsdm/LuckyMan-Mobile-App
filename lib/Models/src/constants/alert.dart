import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Components/text_styling.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/common_widgets/buttons/bottom_button.dart';
import 'package:luckyman_app/src/features/core/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/models/utils/API/api_create_webhook_token.dart';
import 'package:luckyman_app/src/features/core/models/utils/API/api_request.dart';
import 'package:luckyman_app/src/features/core/models/utils/generate_ref.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';
import 'image_strings.dart';

// -- Controllers

final ButtonController buttonController = Get.put(ButtonController());
final SeatSelectionController seatSelectionController =
    Get.put(SeatSelectionController());

alert(String title, String subtitle) {
  return Get.defaultDialog(
    title: title,
    middleText: subtitle,
    backgroundColor: tLightBlue,
    titleStyle: const TextStyle(color: tWhiteColor),
    middleTextStyle: const TextStyle(color: tWhiteColor),
    radius: 10,
  );
}

void showAlertDialog(size, double totalSeatPrice) {
  Get.bottomSheet(
      SizedBox(
        height: size.height * 0.75,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 10, right: 10),
                child: BlackTextWidget(
                  text: "How to view your ticket after payment.",
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "You're about to be redirected to make payment. After successful payment, you'll be taken to a page in the screenshot below: "),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      decoration: kPrimaryBoxDecoration,
                      child: Image.asset(tViewReceiptImage)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: size.width * 0.9,
                    color: const Color(0xFFEBF4FF),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(text: "Do not select", children: [
                          TextSpan(
                            text: " \"VIEW RECEIPT \" ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "instead, select"),
                          TextSpan(
                            text: " \"CONTINUE\" ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "in order to view your ticket which also includes your receipt and Seat Number.")
                        ]),
                      ),
                    )),
              ),
              BottomButton(
                icon: const Icon(
                  FontAwesomeIcons.arrowRightLong,
                  color: Colors.white,
                ),
                bottomTextLabel: "UNDERSTOOD, LET'S GO",
                loadingIcon: Obx(
                  () => SizedBox(
                    child: buttonController.isButtonClicked.value == true
                        ? const CircularProgressIndicator(color: tWhiteColor)
                        : const Text(""),
                  ),
                ),
                onPressed: () async {
                  buttonController.isButtonClicked.value = true;
                  String returnUrl =
                      // await DynamicLinkHandler().createDynamicLink();
                      "https://luckymantandl.page.link/4Yif";

                  String tokenID = await WebhookToken().createWebhookToken();

                  busBookingController.tokenID.value = tokenID;
                  var ref = generateRandomRef(32);

                  print(tokenID);
                  busBookingController.clientReference.value = ref;

                  var checkoutUrl = await APIResponseData().getResponseData(
                      totalSeatPrice.toDouble(), returnUrl, tokenID, ref);

                  var url = Uri.parse(checkoutUrl);

                  await launchUrl(url,
                          webOnlyWindowName: "_blank",
                          mode: LaunchMode.externalApplication)
                      .whenComplete(() {
                    buttonController.isButtonClicked.value = false;
                    Get.back();
                  });
                },
                height: size.width * 0.15,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ));
}
