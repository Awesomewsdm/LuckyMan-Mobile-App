import 'package:angie_notebook/Models/utils/economy_seats.dart';
import 'package:angie_notebook/Models/utils/executive_seat_layout_model.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/accra_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/cape_coast_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/kasoa_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/koforidua_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/sunyani_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/takoradi_seats_layout.dart';
import 'package:angie_notebook/src/common_widgets/destination_seats_layouts/economy__seats_layout/tema_seats_layout.dart';

import '../../common_widgets/destination_seats_layouts/executive_seats_layout/accra_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/cape_coast_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/kasoa_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/koforidua_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/sunyani_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/takoradi_seats_layout.dart';
import '../../common_widgets/destination_seats_layouts/executive_seats_layout/tema_seats_layout.dart';

class UserBooking {
  // final int selectedSeats;
  // final String selectedbusClass;

  final String? selectedDestination;

  UserBooking(this.selectedDestination);
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

  changeEconomySeatsLayout() {
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

  changeExecutiveSeatsLayout() {
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
}
  
   
 
 // void calcPrice() {
    //   // var seatPrice = selectedSeats * executiveSeatPrice.values ;
    // }