import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/Models/utils/economy_seats.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/features/authentification/controllers/seat_selection_controller.dart';

import '../../../../Models/seat_layout_mode.dart';

class KoforiduaEconomySeatLayout extends StatelessWidget {
  final SeatSelectionController seatSelectionController =
      Get.put(SeatSelectionController());
  KoforiduaEconomySeatLayout({Key? key, this.model}) : super(key: key);
  final SeatLayoutModel? model;
  @override
  Widget build(BuildContext context) {
    int seatCounter = 0;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: 1,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  const Text("Bus Type: Koforidua - Economy"),
                  const Divider(
                    color: Colors.lightBlue,
                  ),
                  ...List.generate(model!.rowBreaks[index], (row) {
                    return Wrap(
                      children: List.generate(model!.cols, (col) {
                        // Adding columns breaks
                        // Adding last seats
                        if ((col == model!.gapColIndex) &&
                            (row != model!.rowBreaks[index] - 1 &&
                                model!.isLastFilled)) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: seatSize,
                              width: seatSize,
                              alignment: Alignment.center,
                            ),
                          );
                        }
                        // numbering the seats
                        seatCounter++;
                        String seatNo = '$seatCounter';
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              seatSelectionController.isSeatSelected.value =
                                  true;
                              RxList seats = SeatSelectionController
                                  .instance.selectedKoforiduaEconomySeats;

                              double price =
                                  economyseatLayout.seatTypes[7]["Koforidua"]!;

                              if (seats.contains(seatNo)) {
                                seatSelectionController
                                    .pKoforiduaEconomyseatPrice
                                    .value = seatSelectionController
                                        .pKoforiduaEconomyseatPrice.value -
                                    price;
                                seats.remove(seatNo);
                                 if (seats.isEmpty) {
                                  seatSelectionController.isSeatSelected.value =
                                      false;
                                }
                              } else {
                                seatSelectionController
                                    .pKoforiduaEconomyseatPrice
                                    .value = seatSelectionController
                                        .pKoforiduaEconomyseatPrice.value +
                                    price;
                                if (seats.length >
                                    SeatSelectionController
                                        .instance.noOfSeats) {
                                  Get.snackbar('Sorry',
                                      'you can select up to 5 seats only!',
                                      colorText: Colors.white,
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.7),
                                      snackPosition: SnackPosition.BOTTOM);

                                  seatSelectionController
                                      .pKoforiduaEconomyseatPrice
                                      .value = seatSelectionController
                                          .pKoforiduaEconomyseatPrice.value -
                                      price;

                                  seats.removeAt(4);

                                  seats.add(seatNo);
                                } else {
                                  seats.add(seatNo);
                                }
                              }
                            },
                            child: Obx(() => Container(
                                  height: seatSize,
                                  width: seatSize,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: SeatSelectionController.instance
                                              .selectedKoforiduaEconomySeats
                                              .contains(seatNo)
                                          ? emptySeatColor
                                          : selectedSeatColor,
                                    ),
                                    color: SeatSelectionController.instance
                                            .selectedKoforiduaEconomySeats
                                            .contains(seatNo)
                                        ? selectedSeatColor
                                        : emptySeatColor,
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(7.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: Text(
                                      seatNo,
                                      style: TextStyle(
                                          color: SeatSelectionController
                                                  .instance
                                                  .selectedKoforiduaEconomySeats
                                                  .contains(seatNo)
                                              ? activeSeatNumberColor
                                              : inactiveSeatNumberColor),
                                    ),
                                  ),
                                )),
                          ),
                        );
                      }),
                    );
                  }),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
