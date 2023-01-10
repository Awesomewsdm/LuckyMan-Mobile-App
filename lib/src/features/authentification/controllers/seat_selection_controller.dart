import 'package:angie_notebook/Models/utils/economy_seats.dart';
import 'package:angie_notebook/Models/utils/executive_seat_layout_model.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/accra_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/cape_coast_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/kasoa_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/madina_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/sunyani_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/takoradi_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/tema_seats_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/accra_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/cape_coast_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/kasoa_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/koforidua_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/sunyani_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/takoradi_seats_layout.dart';
import '../../../common_widgets/destination_seats_layouts/executive_seats_layout/tema_seats_layout.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController instance = Get.find();
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

  //  RxString selectedValue = 'ECONOMY'.obs;
  // RxString selectedDropdownMenuItem = 'ECONOMY'.obs;

  int noOfSeats = 4;
  RxDouble pAcrraseatPrice = 0.0.obs;
  RxDouble pCapeCoastseatPrice = 0.0.obs;
  RxDouble pKasoaseatPrice = 0.0.obs;
  RxDouble pKoforiduaseatPrice = 0.0.obs;
  RxDouble pTakoradiseatPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    pAcrraseatPrice = 0.0.obs;
    pCapeCoastseatPrice = 0.0.obs;
    noOfSeats = 4;
  }

  changeEconomySeatsLayout(String? selectedDestination) {
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
    } else {
      return KoforiduaEconomySeatLayout(
        model: economyseatLayout,
      );
    }
  }

  changeExecutiveSeatsLayout(String? selectedDestination) {
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
    } else {
      return KoforiduaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    }
  }

  String changeEconomySeatList(String? selectedDestination) {
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
      selectedKoforiduaEconomySeats.join(' , ');
    }
    return 'NAtd';
  }

  changeExecutiveSeatList(String? selectedDestination) {
    if (selectedDestination == 'Accra') {
      return Obx(
        () => Text(
          selectedAccraExecutiveSeats.join(' , '),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else if (selectedDestination == 'Tema') {
      return Obx(
        () => Text(
          selectedTemaExecutiveSeats.join(' , '),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else if (selectedDestination == 'Takoradi') {
      return Obx(
        () => Text(
          selectedTakoradiExecutiveSeats.join(' , '),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else if (selectedDestination == 'Cape Coast') {
      return Obx(
        () => Text(
          selectedCapeCoastExecutiveSeats.join(' , '),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else if (selectedDestination == 'Sunyani') {
      return Obx(
        () => Text(
          selectedSunyaniExecutiveSeats.join(' , '),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else if (selectedDestination == 'Kasoa') {
      return Obx(
        () => Text(
          selectedKasoaExecutiveSeats.join(' , '),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else {
      return Obx(
        () => Text(
          selectedKoforiduaExecutiveSeats.join(' , '),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
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
