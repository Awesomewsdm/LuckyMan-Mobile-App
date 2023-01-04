import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/accra_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/cape_coast_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/kasoa_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/koforidua_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/sunyani_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/takoradi_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/tema_seats_layout.dart';
import 'package:flutter/cupertino.dart';

import '../../common_widgets/destination_seats_layouts/executive_seats_layout/accra_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/cape_coast_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/kasoa_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/koforidua_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/sunyani_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/takoradi_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/tema_seats_layout.dart';

class UserBooking {
  final int selectedSeats;
  final String selectedbusClass;

  UserBooking(this.selectedSeats, this.selectedbusClass);

  final economySeatPrice = {
    'Accra': 100,
    'Tema': 110,
    'Kasoa': 100,
    'Cape Coast': 90,
    'Koforidua': 80,
    'Sunyani': 100,
  };
  final executiveSeatPrice = {
    'Accra': 120,
    'Tema': 130,
    'Kasoa': 120,
    'Cape Coast': 100,
    'Koforidua': 100,
    'Sunyani': 110,
  };

  Widget changeSeatsLayout(String selectedDestination) {
    if (selectedDestination == 'Accra') {
      return AccraEconomySeatLayout();
    } else if (selectedDestination == 'Tema') {
      return TemaEconomySeatLayout();
    } else if (selectedDestination == 'Takoradi') {
      return TakoradiEconomySeatLayout();
    } else if (selectedDestination == 'Cape Coast') {
      return CapeCoastEconomySeatLayout();
    } else if (selectedDestination == 'Sunyani') {
      return SunyaniEconomySeatLayout();
    } else if (selectedDestination == 'Kasoa') {
      return KasoaEconomySeatLayout();
    } else if (selectedDestination == 'Koforidua') {
      return KoforiduaEconomySeatLayout();
    }

    return AccraEconomySeatLayout();
  }
}
   
   
  Widget changeSeatsLayout(String selectedDestination) {
    if (selectedDestination == 'Accra') {
      return AccraExecutiveSeatLayout();
    } else if (selectedDestination == 'Tema') {
      return TemaExecutiveSeatLayout();
    } else if (selectedDestination == 'Takoradi') {
      return TakoradiExecutiveSeatLayout();
    } else if (selectedDestination == 'Cape Coast') {
      return CapeCoastExecutiveSeatLayout();
    } else if (selectedDestination == 'Sunyani') {
      return SunyaniExecutiveSeatLayout();
    } else if (selectedDestination == 'Kasoa') {
      return KasoaExecutiveSeatLayout();
    } else if (selectedDestination == 'Koforidua') {
      return KoforiduaExecutiveSeatLayout();
    }

    return AccraExecutiveSeatLayout();
  }

 // void calcPrice() {
    //   // var seatPrice = selectedSeats * executiveSeatPrice.values ;
    // }