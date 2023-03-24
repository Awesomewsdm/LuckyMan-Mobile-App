import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get paymentController => Get.find();

  final momoNumber = TextEditingController();
}
