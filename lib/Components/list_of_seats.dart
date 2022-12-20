import 'package:angie_notebook/Components/text_styling.dart';
import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class SeatStatus extends StatelessWidget {
  const SeatStatus({
    Key? key,
    required this.boxColor,
    required this.iconLabel,
    this.icon,
    required this.borderColor,
  }) : super(key: key);
  final Color boxColor;
  final String iconLabel;
  final Widget? icon;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Seats(
          boxColor: boxColor,
          borderColor: borderColor, seatNumber: null,
          // icon: icon,
        ),
        const SizedBox(
          width: 8.0,
        ),
        BlackTextWidget(text: iconLabel),
      ],
    );
  }
}



enum SeatState { booked, empty, selected }

class Seats extends StatefulWidget {
  const Seats({
    Key? key,
    required this.boxColor,
    required this.borderColor,
    // required this.icon,
    required this.seatNumber,
  }) : super(key: key);

  final Color boxColor;
  final Color borderColor;
  // final Widget? icon;
  final int? seatNumber;

  @override
  State<Seats> createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  SeatState? selectedSeat;
  SeatState? unselectedSeat;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSeat = SeatState.booked;
          unselectedSeat = SeatState.empty;
        });
       
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: selectedSeat == SeatState.booked &&
                  unselectedSeat == SeatState.empty
              ? bookedSeatColor
              : selectedSeatColor,
          border: Border.all(
            color: widget.borderColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(7.0),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.seatNumber.toString(),
          style: TextStyle(
              color: selectedSeat == SeatState.booked
                  ? activeSeatNumberColor
                  : inactiveSeatNumberColor),
        ),
      ),
    );
  }
}

// #F1F2F8
// #1394DD
// #318EFD
// #F7F7F7
// #2476ED