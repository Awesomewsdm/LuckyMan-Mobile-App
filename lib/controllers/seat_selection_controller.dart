import 'package:get/get.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController instance = Get.find();
  RxList selectedEconomySeats = [].obs;
   RxList selectedExecutiveSeats = [].obs;
  //  RxString selectedValue = 'ECONOMY'.obs;
  int noOfSeats = 4;
  RxDouble seatPrice = 0.0.obs;

}


class BottomNavController extends GetxController {
  static BottomNavController instance = Get.find();
 
RxInt selectedItemIndex = 0.obs;
void onItemTapped(int index) {
  selectedItemIndex.value = index;
    // ignore: avoid_print
    print(BottomNavController.instance.selectedItemIndex);
  }
}