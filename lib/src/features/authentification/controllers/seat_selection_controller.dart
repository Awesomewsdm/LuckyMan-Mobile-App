import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Models/utils/economy_seats.dart';
import 'package:luckyman_app/Models/utils/executive_seat_layout_model.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/accra_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/cape_coast_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/kasoa_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/koforidua_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/madina_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/sunyani_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/takoradi_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/tema_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/executive_seats_layout/madina_seat_layout.dart';
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

  RxList selectedKoforiduaEconomySeats = [].obs;
  RxList selectedKoforiduaExecutiveSeats = [].obs;

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

  int noOfSeats = 4;

  RxBool isSeatSelected = false.obs;

  // Bus type controllers
  RxString selectedBusType = ''.obs;
  void changeBusType(String value) {
    selectedBusType = value.obs;
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
  RxDouble pAccraExecutiveSeatPrice = 0.0.obs;
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
      BusBookingController.instance.selectedDestination.value;

  String changeEconomySeatPrice() {
    if (selectedDestination == 'Accra' && selectedBusType.value == "Economy") {
      return pAccraEconomySeatPrice.value.toString();
    } else if (selectedDestination == 'Tema' &&
        selectedBusType.value == "Economy") {
      return pTemaEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Takoradi' &&
        selectedBusType.value == "Economy") {
      return pTakoradiEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Cape Coast' &&
        selectedBusType.value == "Economy") {
      return pCapeCoastEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Sunyani' &&
        selectedBusType.value == "Economy") {
      return pSunyaniEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Kasoa' &&
        selectedBusType.value == "Economy") {
      return pKasoaEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Madina' &&
        selectedBusType.value == "Economy") {
      return pMadinaEconomyseatPrice.value.toString();
    } else if (selectedDestination == 'Koforidua' &&
        selectedBusType.value == "Economy") {
      return pKoforiduaEconomyseatPrice.value.toString();
    } else {
      return '0.00';
    }
  }

  String changeExecutiveSeatPrice() {
    if (selectedDestination == 'Accra' &&
        selectedBusType.value == "Executive") {
      return pAccraExecutiveSeatPrice.value.toString();
    } else if (selectedDestination == 'Tema' &&
        selectedBusType.value == "Executive") {
      return pTemaExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Takoradi' &&
        selectedBusType.value == "Executive") {
      return pTakoradiExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Cape Coast' &&
        selectedBusType.value == "Executive") {
      return pCapeCoastExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Sunyani' &&
        selectedBusType.value == "Executive") {
      return pSunyaniExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Koforidua' &&
        selectedBusType.value == "Executive") {
      return pKoforiduaExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Kasoa' &&
        selectedBusType.value == "Executive") {
      return pKasoaExecutiveseatPrice.value.toString();
    } else if (selectedDestination == 'Madina' &&
        selectedBusType.value == "Executive") {
      return pMadinaExecutiveseatPrice.value.toString();
    } else {
      return '0.00';
    }
  }

  Widget changeEconomySeatsLayout() {
    if (selectedDestination == 'Accra' && selectedBusType.value == "Economy") {
      return AccraEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Tema' &&
        selectedBusType.value == "Economy") {
      return TemaEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Takoradi' &&
        selectedBusType.value == "Economy") {
      return TakoradiEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Cape Coast' &&
        selectedBusType.value == "Economy") {
      return CapeCoastEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Sunyani' &&
        selectedBusType.value == "Economy") {
      return SunyaniEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Kasoa' &&
        selectedBusType.value == "Economy") {
      return KasoaEconomySeatLayout(
        model: economyseatLayout,
      );
    } else if (selectedDestination == 'Madina' &&
        selectedBusType.value == "Economy") {
      return MadinaEconomySeatLayout(
        model: economyseatLayout,
      );
    } else {
      return KoforiduaEconomySeatLayout(
        model: economyseatLayout,
      );
    }
    //  else {
    //   return const Center(
    //     child: Text(
    //       'Please select a bus class',
    //       style: TextStyle(fontSize: 18.0),
    //     ),
    //   );
    // }
  }

  Widget changeExecutiveSeatsLayout() {
    if (selectedDestination == 'Accra' &&
        selectedBusType.value == "Executive") {
      return AccraExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Tema' &&
        selectedBusType.value == "Executive") {
      return TemaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Takoradi' &&
        selectedBusType.value == "Executive") {
      return TakoradiExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Cape Coast' &&
        selectedBusType.value == "Executive") {
      return CapeCoastExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Sunyani' &&
        selectedBusType.value == "Executive") {
      return SunyaniExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Kasoa' &&
        selectedBusType.value == "Executive") {
      return KasoaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Koforidua' &&
        selectedBusType.value == "Executive") {
      return KoforiduaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Madina' &&
        selectedBusType.value == "Executive") {
      return MadinaExecutiveSeatLayout(
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
    if (selectedDestination == 'Accra' &&
        selectedBusType.value == "Executive") {
      return selectedAccraEconomySeats.join(' , ');
    } else if (selectedDestination == 'Tema' &&
        selectedBusType.value == "Executive") {
      return selectedTemaEconomySeats.join(' , ');
    } else if (selectedDestination == 'Takoradi' &&
        selectedBusType.value == "Executive") {
      return selectedTakoradiEconomySeats.join(' , ');
    } else if (selectedDestination == 'Cape Coast' &&
        selectedBusType.value == "Executive") {
      return selectedCapeCoastEconomySeats.join(' , ');
    } else if (selectedDestination == 'Sunyani' &&
        selectedBusType.value == "Executive") {
      return selectedSunyaniEconomySeats.join(' , ');
    } else if (selectedDestination == 'Kasoa' &&
        selectedBusType.value == "Executive") {
      return selectedKasoaEconomySeats.join(' , ');
    } else if (selectedDestination == 'Madina' &&
        selectedBusType.value == "Executive") {
      return selectedMadinaEconomySeats.join(' , ');
    } else if (selectedDestination == 'Koforidua' &&
        selectedBusType.value == "Executive") {
      return selectedKoforiduaEconomySeats.join(' , ');
    } else {
      return '';
    }
  }

  String changeExecutiveSeatList() {
    if (selectedDestination == 'Accra' &&
        selectedBusType.value == "Executive") {
      return selectedAccraExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Tema' &&
        selectedBusType.value == "Executive") {
      return selectedTemaExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Takoradi' &&
        selectedBusType.value == "Executive") {
      return selectedTakoradiExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Cape Coast' &&
        selectedBusType.value == "Executive") {
      return selectedCapeCoastExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Sunyani' &&
        selectedBusType.value == "Executive") {
      return selectedSunyaniExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Kasoa' &&
        selectedBusType.value == "Executive") {
      return selectedKasoaExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Madina' &&
        selectedBusType.value == "Executive") {
      return selectedMadinaExecutiveSeats.join(' , ');
    } else if (selectedDestination == 'Koforidua' &&
        selectedBusType.value == "Executive") {
      return selectedKoforiduaExecutiveSeats.join(' , ');
    } else {
      return '';
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
