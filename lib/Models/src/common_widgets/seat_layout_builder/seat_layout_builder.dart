import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Models/seat_layout_mode.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/seat_selection_controller.dart';

class SeatLayoutBuilder extends StatelessWidget {
  SeatLayoutBuilder({
    super.key,
    required this.model,
    required this.seatSelectionController,
    required this.destination,
    required this.selectedSeatList,
    required this.busClass,
    required this.amount,
    required this.ticketPrice,
    required this.bookedSeatsFromDB,
  });

  final SeatLayoutModel? model;
  final SeatSelectionController seatSelectionController;
  final String destination;
  final String busClass;
  final RxList<dynamic> selectedSeatList;
  final RxDouble amount;
  final double ticketPrice;
  final List<dynamic> bookedSeatsFromDB;

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  @override
  Widget build(BuildContext context) {
    int seatCounter = 0;
    RxDouble unitSeatPrice = amount;
    double seatSize = 35.0;

    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: 1,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Bus Type: ${destination.capitalizeFirst} - ${busClass.capitalizeFirst}"),
            ),
            const Divider(
              color: tLightBlue,
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

                  var isBooked = bookedSeatsFromDB.contains(seatNo);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: GestureDetector(
                        onTap: isBooked
                            ? null
                            : () {
                                seatSelectionController.isSeatSelected.value =
                                    true;

                                // var dbPriceDocRef = await BusSeatsPrices()
                                //     .getSeatPrices(
                                //         '$busClass-bus-seats-prices');

                                // final price = dbPriceDocRef![destination];

                                if (selectedSeatList.contains(seatNo)) {
                                  unitSeatPrice.value =
                                      unitSeatPrice.value - ticketPrice;

                                  selectedSeatList.remove(seatNo);

                                  if (selectedSeatList.isEmpty) {
                                    seatSelectionController
                                        .isSeatSelected.value = false;
                                  }
                                } else {
                                  unitSeatPrice.value =
                                      unitSeatPrice.value + ticketPrice;

                                  if (selectedSeatList.length >
                                      SeatSelectionController
                                          .instance.noOfSeats) {
                                    unitSeatPrice.value =
                                        unitSeatPrice.value - ticketPrice;

                                    selectedSeatList.removeAt(4);

                                    selectedSeatList.add(seatNo);
                                  } else {
                                    selectedSeatList.add(seatNo);
                                  }
                                }
                                busBookingController.userSelectedSeats.value =
                                    selectedSeatList;
                              },
                        child: Obx(
                          () => Container(
                            height: seatSize,
                            width: seatSize,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedSeatList.contains(seatNo)
                                    ? emptySeatColor
                                    : selectedSeatColor,
                              ),
                              color: isBooked
                                  ? bookedSeatColor
                                  : selectedSeatList.contains(seatNo)
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
                                  color: isBooked
                                      ? activeSeatNumberColor
                                      : selectedSeatList.contains(seatNo)
                                          ? activeSeatNumberColor
                                          : inactiveSeatNumberColor,
                                ),
                              ),
                            ),
                          ),
                        )),
                  );
                }),
              );
            }),
          ],
        );
      }),
    );
  }
}
