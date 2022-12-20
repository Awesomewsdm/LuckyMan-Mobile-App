import 'package:angie_notebook/Constants/constants.dart';
import 'package:flutter/material.dart';

import '../Models/seat_layout_mode.dart';

class SeatLayout extends StatelessWidget {
  const SeatLayout({Key? key, this.model}) : super(key: key);
  final SeatLayoutModel? model;
  @override
  Widget build(BuildContext context) {
    int seatCounter = 1;
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
                            (row != model!.rowBreaks[index] &&
                                model!.isLastFilled)) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30.0,
                              width: 30.0,
                              alignment: Alignment.center,
                            ),
                          );
                        }

                        // numbering the seats
                        seatCounter++;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: bookedSeatColor,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(7.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text('$seatCounter'),
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
