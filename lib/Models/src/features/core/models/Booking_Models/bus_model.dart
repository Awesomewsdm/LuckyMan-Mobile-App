// ignore_for_file: public_member_api_docs, sort_constructors_first

class BusModel {
  final String busNo;
  final int ticketPrice;
  final String departureDate;
  final String departureTime;
  final String busType;
  final String origin;
  final String destination;
  final String pickupPoint;
  final List<dynamic> bookedSeats;
  final int noOfSeats;

  BusModel({
    required this.busNo,
    required this.ticketPrice,
    required this.departureDate,
    required this.departureTime,
    required this.busType,
    required this.origin,
    required this.destination,
    required this.pickupPoint,
    required this.bookedSeats,
    required this.noOfSeats,
  });

  factory BusModel.fromMap(Map<String, dynamic> map) {
    return BusModel(
      busNo: map['busNo'],
      ticketPrice: map['ticketPrice'],
      departureDate: map['departureDate'],
      departureTime: map['departureTime'],
      busType: map['busType'],
      origin: map['origin'],
      destination: map['destination'],
      pickupPoint: map['pickupPoint'],
      bookedSeats: List<dynamic>.from(map['bookedSeats']),
      noOfSeats: map['noOfSeats'],
    );
  }
}
