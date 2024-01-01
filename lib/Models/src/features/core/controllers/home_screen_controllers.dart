import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();

  int selectedIndex = 0;
  onItemTapped(int index) {
    selectedIndex = index;
  }
}
