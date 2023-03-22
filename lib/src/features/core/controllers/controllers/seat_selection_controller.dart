import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/accra_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/cape_coast_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/kasoa_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/koforidua_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/madina_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/sunyani_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/takoradi_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/economy__seats_layout/tema_seats_layout.dart';
import 'package:luckyman_app/src/common_widgets/destination_seats_layouts/executive_seats_layout/madina_seat_layout.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/models/utils/Bus%20Seat%20Layout/economy_seats.dart';
import 'package:luckyman_app/src/features/core/models/utils/Bus%20Seat%20Layout/executive_seat_layout_model.dart';
import '../../../../common_widgets/destination_seats_layouts/executive_seats_layout/accra_seats_layout.dart';
import '../../../../common_widgets/destination_seats_layouts/executive_seats_layout/cape_coast_seats_layout.dart';
import '../../../../common_widgets/destination_seats_layouts/executive_seats_layout/kasoa_seats_layout.dart';
import '../../../../common_widgets/destination_seats_layouts/executive_seats_layout/koforidua_seats_layout.dart';
import '../../../../common_widgets/destination_seats_layouts/executive_seats_layout/sunyani_seats_layout.dart';
import '../../../../common_widgets/destination_seats_layouts/executive_seats_layout/takoradi_seats_layout.dart';
import '../../../../common_widgets/destination_seats_layouts/executive_seats_layout/tema_seats_layout.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController get instance => Get.find();

  BusBookingController busBookingController = Get.put(
    BusBookingController(),
  );

  final db = FirebaseFirestore.instance;

   final tokenID = Rxn<String>();
   final clientReference = Rxn<String>();

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

  final isSeatSelected = Rxn<bool>();

  final isSeatBooked = Rxn<bool>();

  // Bus type controllers
  final selectedBusClass = Rxn<String>();
  void changeBusClass(String? value) {
    selectedBusClass.value = value!;
  }

  RxBool isPaymentButtonClicked = false.obs;

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

  // @override
  // void onReady() {
  //   super.onReady();
  //   pAccraEconomySeatPrice = 0.0.obs;
  //   pCapeCoastEconomyseatPrice = 0.0.obs;
  //   pKasoaEconomyseatPrice = 0.0.obs;
  //   pKoforiduaEconomyseatPrice = 0.0.obs;
  //   pTakoradiEconomyseatPrice = 0.0.obs;
  //   pMadinaEconomyseatPrice = 0.0.obs;
  //   pTemaEconomyseatPrice = 0.0.obs;
  //   pSunyaniEconomyseatPrice = 0.0.obs;
  //   noOfSeats = 4;
  // }

  String selectedDestination =
      BusBookingController.instance.selectedDestination.toString();

String selectedBusType =
       BusBookingController.instance.selectedBusType.toString();

  double changeEconomySeatPrice() {
    if (selectedDestination == 'Accra') {
      return pAccraEconomySeatPrice.value;
    } else if (selectedDestination == 'Tema') {
      return pTemaEconomyseatPrice.value;
    } else if (selectedDestination == 'Takoradi') {
      return pTakoradiEconomyseatPrice.value;
    } else if (selectedDestination == 'Cape Coast') {
      return pCapeCoastEconomyseatPrice.value;
    } else if (selectedDestination == 'Sunyani') {
      return pSunyaniEconomyseatPrice.value;
    } else if (selectedDestination == 'Kasoa') {
      return pKasoaEconomyseatPrice.value;
    } else if (selectedDestination == 'Madina') {
      return pMadinaEconomyseatPrice.value;
    } else if (selectedDestination == 'Koforidua') {
      return pKoforiduaEconomyseatPrice.value;
    } else {
      return 0.00;
    }
  }

  double changeExecutiveSeatPrice() {
    if (selectedDestination == 'Accra') {
      return pAccraExecutiveSeatPrice.value;
    } else if (selectedDestination == 'Tema') {
      return pTemaExecutiveseatPrice.value;
    } else if (selectedDestination == 'Takoradi') {
      return pTakoradiExecutiveseatPrice.value;
    } else if (selectedDestination == 'Cape Coast') {
      return pCapeCoastExecutiveseatPrice.value;
    } else if (selectedDestination == 'Sunyani') {
      return pSunyaniExecutiveseatPrice.value;
    } else if (selectedDestination == 'Koforidua') {
      return pKoforiduaExecutiveseatPrice.value;
    } else if (selectedDestination == 'Kasoa') {
      return pKasoaExecutiveseatPrice.value;
    } else if (selectedDestination == 'Madina') {
      return pMadinaExecutiveseatPrice.value;
    } else {
      return 0.00;
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
    } else if (selectedDestination == 'Koforidua') {
      return KoforiduaEconomySeatLayout(
        model: economyseatLayout,
      );
    } else {
      return Center(
        child: Text(
          selectedDestination,
          style: const TextStyle(fontSize: 18.0),
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
      return KasoaExecutiveSeatLayout();
    } else if (selectedDestination == 'Koforidua') {
      return KoforiduaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else if (selectedDestination == 'Madina') {
      return MadinaExecutiveSeatLayout(
        model: executiveseatLayout,
      );
    } else {
      return Center(
        child: Text(
          selectedDestination,
          style: const TextStyle(fontSize: 18.0),
        ),
      );
    }
  }

  List changeEconomySeatList() {
    if (selectedDestination == 'Accra') {
      return selectedAccraEconomySeats;
    } else if (selectedDestination == 'Tema') {
      return selectedTemaEconomySeats;
    } else if (selectedDestination == 'Takoradi') {
      return selectedTakoradiEconomySeats;
    } else if (selectedDestination == 'Cape Coast') {
      return selectedCapeCoastEconomySeats;
    } else if (selectedDestination == 'Sunyani') {
      return selectedSunyaniEconomySeats;
    } else if (selectedDestination == 'Kasoa') {
      return selectedKasoaEconomySeats;
    } else if (selectedDestination == 'Madina') {
      return selectedMadinaEconomySeats;
    } else if (selectedDestination == 'Koforidua') {
      return selectedKoforiduaEconomySeats;
    } else {
      return [];
    }
  }

  List changeExecutiveSeatList() {
    if (selectedDestination == 'Accra') {
      return selectedAccraExecutiveSeats;
    } else if (selectedDestination == 'Tema') {
      return selectedTemaExecutiveSeats;
    } else if (selectedDestination == 'Takoradi') {
      return selectedTakoradiExecutiveSeats;
    } else if (selectedDestination == 'Cape Coast') {
      return selectedCapeCoastExecutiveSeats;
    } else if (selectedDestination == 'Sunyani') {
      return selectedSunyaniExecutiveSeats;
    } else if (selectedDestination == 'Kasoa') {
      return selectedKasoaExecutiveSeats;
    } else if (selectedDestination == 'Madina') {
      return selectedMadinaExecutiveSeats;
    } else if (selectedDestination == 'Koforidua') {
      return selectedKoforiduaExecutiveSeats;
    } else {
      return [];
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
