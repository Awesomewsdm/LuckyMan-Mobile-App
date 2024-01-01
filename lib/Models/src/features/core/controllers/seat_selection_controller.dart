import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';

BusBookingController busBookingController = Get.put(
  BusBookingController(),
);

class SeatSelectionController extends GetxController {
  static SeatSelectionController get instance => Get.find();

  RxDouble seatPrice = 0.0.obs;
  RxString reference = "".obs;
  // RxInt totalSeatPrice = 0.obs;
  RxList bookedSeats = [].obs;
  RxList userSelectedSeats = [].obs;
  // final tokenID = Rxn<String>();
  // RxString clientReference = "".obs;
  int noOfSeats = 4;
  final isSeatSelected = Rxn<bool>();

  // Bus type controllers
  final selectedBusClass = Rxn<String>();
  void changeBusClass(String? value) {
    selectedBusClass.value = value!;
  }

  @override
  void onReady() {
    super.onReady();
    noOfSeats = 4;
  }
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
