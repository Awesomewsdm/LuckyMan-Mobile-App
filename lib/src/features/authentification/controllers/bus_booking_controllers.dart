import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusBookingController extends GetxController {
  
   static BusBookingController get instance => Get.find();

  final selectedDestination = ''.obs;
  void changeSelectedDestination(String? value) {
    selectedDestination.value = value!;
  }

  final selectedBusType = ''.obs;
  changeSelectedBusType(String? value) {
    selectedBusType.value = value!;
  }

  final selectedDepatureTime = ''.obs;
  changeselectedDepatureTime(String? value) {
    selectedDepatureTime.value = value!;
  }

  final selectedDepatureDate = ''.obs;
  changeselectedDepatureDate(String? value) {
    selectedDepatureDate.value = value!;
  }

   final selectedPickupPoint = ''.obs;
  changeselectedselectedPickupPoint(String? value) {
    selectedPickupPoint.value = value!;
  }

  
   final agentName = TextEditingController();
}
