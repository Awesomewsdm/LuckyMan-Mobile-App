import 'package:angie_notebook/Constants/constants.dart';
import 'package:flutter/material.dart';

import '../Models/seat_layout_mode.dart';

class ExecutiveSeatLayout extends StatelessWidget {
  const ExecutiveSeatLayout({Key? key, this.model}) : super(key: key);
  final SeatLayoutModel? model;
  @override
  Widget build(BuildContext context) {
    int seatCounter = 0;
   
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: model!.seatTypes.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  ...List.generate(model!.rowBreaks[index], (row) {
                    return Wrap(
                      children: List.generate(model!.cols, (col) {
                        // Adding columns breaks
                        // Adding last seats
                        if ((col == model!.gapColIndex) &&
                            (row != model!.rowBreaks[index] - 1 &&
                                model!.isLastFilled)) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: seatSize,
                              width: seatSize,
                              alignment: Alignment.center,
                            ),
                          );
                        }

                        // numbering the seats
                        seatCounter++;

                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: seatSize,
                            width: seatSize,
                            decoration: BoxDecoration(
                              color: emptySeatColor,
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(7.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                seatCounter < 10
                                    ? '0$seatCounter'
                                    : seatCounter.toString(),
                              ),
                            ),
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
