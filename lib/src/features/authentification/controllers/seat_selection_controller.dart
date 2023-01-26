import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Models/utils/economy_seats.dart';
import 'package:luckyman_app/Models/utils/executive_seat_layout_model.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/accra_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/cape_coast_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/kasoa_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/madina_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/sunyani_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/takoradi_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/tema_seats_layout.dart';
import 'package:luckyman_app/src/features/authentification/controllers/bus_booking_controllers.dart';

import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/accra_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/cape_coast_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/kasoa_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/koforidua_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/sunyani_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/takoradi_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/tema_seats_layout.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController instance = Get.find();

  BusBookingController busBookingController = Get.put(
    BusBookingController(),
  );

  RxList selectedMadinaEconomySeats = [].obs;
  RxList selectedMadinaExecutiveSeats = [].obs;

  RxList selectedAccraEconomySeats = [].obs;
  RxList selectedCapeCoastEconomySeats = [].obs;
  RxList selectedKasoaEconomySeats = [].obs;
  RxList selectedSunyaniEconomySeats = [].obs;
  RxList selectedTakoradiEconomySeats = [].obs;
  RxList selectedTemaEconomySeats = [].obs;

  RxList selectedTakoradiExecutiveSeats = [].obs;
  RxList selectedAccraExecutiveSeats = [].obs;
  RxList selectedCapeCoastExecutiveSeats = [].obs;
  RxList selectedKasoaExecutiveSeats = [].obs;
  RxList selectedSunyaniExecutiveSeats = [].obs;
  RxList selectedTemaExecutiveSeats = [].obs;

  //  RxString selectedValue = 'ECONOMY'.obs;
  // RxString selectedDropdownMenuItem = 'ECONOMY'.obs;

  int noOfSeats = 4;

  // RxDouble seatPrice = 0.0.obs;
  // calcSeatPrice(double amount) {
  //   seatPrice.value += amount;
  // }

  // Bus type controllers
  RxString selectedBusType = 'ECONOMY'.obs;
  void changeBusType(String? value) {
    selectedBusType.value = value!;
  }

  // Economy seat prices
  RxDouble pAccraEconomySeatPrice = 0.0.obs;
  RxDouble pCapeCoastEconomyseatPrice = 0.0.obs;
  RxDouble pKasoaEconomyseatPrice = 0.0.obs;
  RxDouble pKoforiduaEconomyseatPrice = 0.0.obs;
  RxDouble pTakoradiEconomyseatPrice = 0.0.obs;
  RxDouble pMadinaEconomyseatPrice = 0.0.obs;
  RxDouble pTemaEconomyseatPrice = 0.0.obs;
  RxDouble pSunyaniEconomyseatPrice = 0.0.obs;

  // Executive seat prices
  RxDouble pAccraExecutiveEcoSeatPrice = 0.0.obs;
  RxDouble pCapeCoastExecutiveseatPrice = 0.0.obs;
  RxDouble pKasoaExecutiveseatPrice = 0.0.obs;
  RxDouble pKoforiduaExecutiveseatPrice = 0.0.obs;
  RxDouble pTakoradiExecutiveseatPrice = 0.0.obs;
  RxDouble pMadinaExecutiveseatPrice = 0.0.obs;
  RxDouble pTemaExecutiveseatPrice = 0.0.obs;
  RxDouble pSunyaniExecutiveseatPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    pAccraEconomySeatPrice = 0.0.obs;
    pCapeCoastEconomyseatPrice = 0.0.obs;
    pKasoaEconomyseatPrice = 0.0.obs;
    pKoforiduaEconomyseatPrice = 0.0.obs;
    pTakoradiEconomyseatPrice = 0.0.obs;
    pMadinaEconomyseatPrice = 0.0.obs;
    pTemaEconomyseatPrice = 0.0.obs;
    pSunyaniEconomyseatPrice = 0.0.obs;
    noOfSeats = 4;
  }

  String selectedDestination =
      BusBookingController.instance.selectedDestination.toString();

  String changeEconomySeatPrice() {
    if (selectedDestination == 'Accra') {
      return pAccraEconomySeatPrice.value.toString();
    } else if (selectedDestination == 'Tema') {
      return pTemaEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Takoradi') {
      return pTakoradiEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Cape Coast') {
      return pCapeCoastEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Sunyani') {
      return pSunyaniEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Kasoa') {
      return pKasoaEconomyseatPrice.value.toString();
    } else {
      return pKoforiduaEconomyseatPrice.value.toString();
    }
  }

  String changeExecutiveSeatPrice() {
    if (selectedDestination == 'Accra') {
      return pAccraExecutiveEcoSeatPrice.value.toString();
    } else if (selectedDestination == 'Tema') {
      return pTemaExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Takoradi') {
      return pTakoradiExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Cape Coast') {
      return pCapeCoastExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Sunyani') {
      return pSunyaniExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Kasoa') {
      return pKasoaExecutiveseatPrice.value.toString();
    } else {
      return pMadinaExecutiveseatPrice.value.toString();
    }
  }

  Widget changeEconomySeatsLayout() {
    if (selectedDestination == 'Accra') {
      return AccraEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Tema') {
      return TemaEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Takoradi') {
      return TakoradiEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Cape Coast') {
      return CapeCoastEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Sunyani') {
      return SunyaniEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Kasoa') {
      return KasoaEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Madina') {
      return MadinaEconomySeatLayout(
        model: economyseatLayout,
      );
    } else {
      return const Center(
        child: Text(
          'Please select a bus class',
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }
  }

  Widget changeExecutiveSeatsLayout() {
    if (selectedDestination == 'Accra') {
      return AccraExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Tema') {
      return TemaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Takoradi') {
      return TakoradiExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Cape Coast') {
      return CapeCoastExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Sunyani') {
      return SunyaniExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Kasoa') {
      return KasoaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Koforidua') {
      return KoforiduaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else {
      return const Center(
        child: Text(
          'Please select a bus class',
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }
  }

  String changeEconomySeatList() {
    if (selectedDestination == 'Accra') {
      return selectedAccraEconomySeats.join(' , ');
    } else if (selectedDestination == 'Tema') {
      selectedTemaEconomySeats.join(' , ');
    } else if (selectedDestination == 'Takoradi') {
      return selectedTakoradiEconomySeats.join(' , ');
    } else if (selectedDestination == 'Cape Coast') {
      selectedCapeCoastEconomySeats.join(' , ');
    } else if (selectedDestination == 'Sunyani') {
      selectedSunyaniEconomySeats.join(' , ');
    } else if (selectedDestination == 'Kasoa') {
      selectedKasoaEconomySeats.join(' , ');
    } else {
      selectedMadinaEconomySeats.join(' , ');
    }
    return 'NAtd';
  }

  String changeExecutiveSeatList() {
    if (selectedDestination == 'Accra') {
      return selectedAccraExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Tema') {
      return selectedTemaExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Takoradi') {
      return selectedTakoradiExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Cape Coast') {
      return selectedCapeCoastExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Sunyani') {
      return selectedSunyaniExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Kasoa') {
      return selectedKasoaExecutiveSeats.join(' , ');
    } else {
      return selectedMadinaExecutiveSeats.join(' , ');
    }
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
