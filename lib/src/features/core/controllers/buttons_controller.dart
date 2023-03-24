
import 'package:get/get.dart';


class ButtonController extends GetxController {
  static ButtonController get instance => Get.find();


  RxBool isButtonClicked = false.obs;
 
}
