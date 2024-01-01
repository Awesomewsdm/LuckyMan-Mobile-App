import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckyman_app/Constants/constants.dart';

class BusInfoCard extends StatelessWidget {
  const BusInfoCard({
    super.key,
    required this.busNo,
    required this.ticketPrice,
    required this.departureDate,
    required this.departureTime,
    required this.busType,
    required this.origin,
    required this.destination,
    required this.pickupPoint,
    required this.remainingSeats,
    required this.bookedSeats,
    this.onTap,
  });

  final double busCardHeight = 260;

  final String busNo;
  final String ticketPrice;
  final String departureDate;
  final String departureTime;
  final String busType;
  final String origin;
  final String destination;
  final String pickupPoint;
  final int remainingSeats;
  final String bookedSeats;
  final void Function()? onTap;

  // final BusModel _busModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: SizedBox(
        height: busCardHeight + 15,
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            height: busCardHeight,
            width: size.width,
            decoration: kHomeWidgetsBoxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BusInfoTitleWidget(
                      title: "Bus No",
                      //  "GH-023-12"
                      description: busNo,
                    ),
                    BusInfoTitleWidget(
                      title: "Status",
                      //  "GH-023-12"
                      description: remainingSeats == 0 ? "FULL" : "AVAILABLE",
                    ),
                    BusInfoTitleWidget(
                      title: "Price",
                      description: "¢$ticketPrice",
                      //  "¢120",
                      fontSize: 24,
                      textColor: const Color.fromARGB(255, 235, 155, 7),
                      alignment: CrossAxisAlignment.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/Bus.png",
                      width: 50,
                      height: 50,
                    ),
                    BusInfoTitleWidget(
                      title: "Departure Date",
                      description: departureDate,
                      // "07-09-2023",
                      alignment: CrossAxisAlignment.end,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CircleWidget(
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BusInfoTitleWidget(
                      title: "From",
                      description: origin,
                      // "KNUST",
                      alignment: CrossAxisAlignment.start,
                    ),
                    const Spacer(),
                    BusInfoTitleWidget(
                      title: "Type",
                      description: busType,
                      // "VIP",
                      alignment: CrossAxisAlignment.center,
                    ),
                    const Spacer(),
                    BusInfoTitleWidget(
                      title: "Departure Time",
                      description: departureTime,
                      // "12:00",
                      alignment: CrossAxisAlignment.end,
                    ),
                  ],
                ),
                const Expanded(
                    child: VerticalDivider(
                  thickness: 2,
                  color: Color.fromARGB(255, 230, 113, 4),
                )),
                Row(
                  children: [
                    const CircleWidget(
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BusInfoTitleWidget(
                      title: "To",
                      description: destination,
                      // "KOFORIDUA",
                      alignment: CrossAxisAlignment.start,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200,
                      child: BusInfoTitleWidget(
                        title: "Pickup Point",
                        description: pickupPoint,
                        alignment: CrossAxisAlignment.end,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.lightBlue,
                ),
                Row(
                  children: [
                    Text(
                      "Booked Seats: $bookedSeats",
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      "Remaining Seats: $remainingSeats",
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              // color: Colors.lightBlue,
              width: size.width,
              height: 32,
              child: Center(
                  // : const EdgeInsets.symmetric(horizontal: 90),padding
                  child: InkWell(
                onTap: remainingSeats == 0 ? null : onTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: remainingSeats == 0 ? Colors.red : Colors.lightBlue,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  width: 200,
                  height: 32,
                  child: Center(
                      child: Text(
                    "BOOK A SEAT",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )),
            ),
          ),
        ]),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          width: 2.0,
          color: color,
        ),
      ),
    );
  }
}

class BusInfoTitleWidget extends StatelessWidget {
  const BusInfoTitleWidget({
    super.key,
    required this.title,
    required this.description,
    this.alignment = CrossAxisAlignment.start,
    this.fontSize = 15,
    this.textColor = Colors.black,
  });

  final String title;
  final String description;
  final CrossAxisAlignment alignment;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        Text(
          style: GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor),
          description,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
