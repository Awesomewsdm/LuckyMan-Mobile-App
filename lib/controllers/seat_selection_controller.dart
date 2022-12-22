import 'package:get/get.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController instance = Get.find();
  RxList selectedSeats = [].obs;
  //  RxString selectedValue = 'ECONOMY'.obs;
}