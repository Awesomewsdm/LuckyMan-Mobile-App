import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/Constants/constants.dart';
import 'package:luckyman_app/src/constants/colors.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/controllers/seat_selection_controller.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/bus_seat_prices.dart';
import 'package:luckyman_app/src/features/core/models/Booking_Models/seat_layout_mode.dart';

class SeatLayoutBuilder extends StatelessWidget {
   SeatLayoutBuilder({
    super.key,
    required this.model,
    required this.seatSelectionController,
    required this.destination,
    required this.selectedSeatList,
    required this.amount,
    required this.busClass,
  });

  final SeatLayoutModel? model;
  final SeatSelectionController seatSelectionController;
  final String destination;
  final String busClass;
  final RxList<dynamic> selectedSeatList;
  final RxDouble amount;

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  @override
  Widget build(BuildContext context) {
    int seatCounter = 0;
    RxDouble unitSeatPrice = amount;

    return Column(

      children: [
        FutureBuilder(
          future: busBookingController.getBookingDataFromDB("booked-$busClass-seats"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<dynamic> seatList = snapshot.data![destination];
                return Expanded(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Text("Bus Type: ${destination.capitalizeFirst} - ${busClass.capitalizeFirst}"),
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
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 10.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: seatList.contains(seatNo)
                                        ? null
                                        : () async {
                                            seatSelectionController
                                                .isSeatSelected.value = true;

                                            var dbPriceDocRef =
                                                await BusSeatsPrices()
                                                    .getSeatPrices(
                                                        '$busClass-bus-seats-prices');

                                            final price =
                                                dbPriceDocRef![destination];

                                            RxList seats = selectedSeatList;

                                            if (seats.contains(seatNo)) {
                                              unitSeatPrice.value =
                                                  unitSeatPrice.value - price;

                                              seats.remove(seatNo);

                                              if (seats.isEmpty) {
                                                seatSelectionController
                                                    .isSeatSelected
                                                    .value = false;
                                              }
                                            } else {
                                              unitSeatPrice.value =
                                                  unitSeatPrice.value + price;

                                              if (seats.length >
                                                  SeatSelectionController
                                                      .instance.noOfSeats) {
                                                
                                                unitSeatPrice.value =
                                                    unitSeatPrice.value - price;

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
                                              color: selectedSeatList
                                                      .contains(seatNo)
                                                  ? emptySeatColor
                                                  : selectedSeatColor,
                                            ),
                                            color: seatList.contains(seatNo)
                                                ? bookedSeatColor
                                                : selectedSeatList
                                                        .contains(seatNo)
                                                    ? selectedSeatColor
                                                    : emptySeatColor,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(7.0),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Center(
                                            child: Text(
                                              seatNo,
                                              style: TextStyle(
                                                color: seatList.contains(seatNo)
                                                    ? activeSeatNumberColor
                                                    : selectedSeatList
                                                            .contains(seatNo)
                                                        ? activeSeatNumberColor
                                                        : inactiveSeatNumberColor,
                                              ),
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
                );
              } else {
                return const Text("Something went wrong");
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
