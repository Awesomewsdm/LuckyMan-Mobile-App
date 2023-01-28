import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController instance = Get.find();

  RxInt selectedIndex = 0.obs;
   onItemTapped(int index) {
    selectedIndex = index.obs;
  }
}
