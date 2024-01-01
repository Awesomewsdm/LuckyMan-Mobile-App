import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

class ButtonController extends GetxController {
  static ButtonController get instance => Get.find();

  RxBool isButtonClicked = false.obs;

  final stateOnlyCustomIndicatorText = Rxn<ButtonState>();
}
