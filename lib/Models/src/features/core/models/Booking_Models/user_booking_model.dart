// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserBookingModel {
  final String selectedOrigin;
  final String selectedDestination;
  final String selectedPickupPoint;
  final String selectedBusType;
  final String selectedDepartureTime;
  final String selectedDepartureDate;
  final String agentName;
  final String userName;
  final String selectedBusClass;
  final String selectedSeatNo;
  final String price;
  final bool isUserBooked;
  final bool isUserBookingComplete;
  final String? phoneNumber;

  UserBookingModel({
    required this.selectedOrigin,
    required this.selectedDestination,
    required this.selectedPickupPoint,
    required this.selectedBusType,
    required this.selectedDepartureTime,
    required this.selectedDepartureDate,
    required this.agentName,
    required this.userName,
    required this.selectedBusClass,
    required this.selectedSeatNo,
    required this.price,
    required this.isUserBooked,
    required this.isUserBookingComplete,
    this.phoneNumber,
  });

  UserBookingModel copyWith({
    String? selectedOrigin,
    String? selectedDestination,
    String? selectedPickupPoint,
    String? selectedBusType,
    String? selectedDepatureTime,
    String? selectedDepatureDate,
    String? agentName,
    String? userName,
    String? selectedBusClass,
    String? selectedSeatNo,
    String? price,
    bool? isUserBooked,
    bool? isUserBookingComplete,
    String? phoneNumber,
  }) {
    return UserBookingModel(
      selectedOrigin: selectedOrigin ?? this.selectedOrigin,
      selectedDestination: selectedDestination ?? this.selectedDestination,
      selectedPickupPoint: selectedPickupPoint ?? this.selectedPickupPoint,
      selectedBusType: selectedBusType ?? this.selectedBusType,
      selectedDepartureTime: selectedDepatureTime ?? selectedDepartureTime,
      selectedDepartureDate: selectedDepatureDate ?? selectedDepartureDate,
      agentName: agentName ?? this.agentName,
      userName: userName ?? this.userName,
      selectedBusClass: selectedBusClass ?? this.selectedBusClass,
      selectedSeatNo: selectedSeatNo ?? this.selectedSeatNo,
      price: price ?? this.price,
      isUserBooked: isUserBooked ?? this.isUserBooked,
      isUserBookingComplete:
          isUserBookingComplete ?? this.isUserBookingComplete,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  toJson() {
    return {
      'selectedDestination': selectedDestination,
      'selectedPickupPoint': selectedPickupPoint,
      'selectedBusType': selectedBusType,
      'selectedDepatureTime': selectedDepartureTime,
      'selectedDepatureDate': selectedDepartureDate,
      'agentName': agentName,
      'userName': userName,
      'selectedBusClass': selectedBusClass,
      'selectedSeatNo': selectedSeatNo,
      'price': price,
      'isUserBooked': isUserBooked,
      'isUserBookingComplete': isUserBookingComplete,
      'phoneNumber': phoneNumber,
      'selectedOrigin': selectedOrigin,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedOrigin': selectedOrigin,
      'selectedDestination': selectedDestination,
      'selectedPickupPoint': selectedPickupPoint,
      'selectedBusType': selectedBusType,
      'selectedDepatureTime': selectedDepartureTime,
      'selectedDepatureDate': selectedDepartureDate,
      'agentName': agentName,
      'userName': userName,
      'selectedBusClass': selectedBusClass,
      'selectedSeatNo': selectedSeatNo,
      'price': price,
      'isUserBooked': isUserBooked,
      'isUserBookingComplete': isUserBookingComplete,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserBookingModel.fromMap(Map<String, dynamic> map) {
    return UserBookingModel(
      selectedOrigin: map['selectedOrigin'] as String,
      selectedDestination: map['selectedDestination'] as String,
      selectedPickupPoint: map['selectedPickupPoint'] as String,
      selectedBusType: map['selectedBusType'] as String,
      selectedDepartureTime: map['selectedDepatureTime'] as String,
      selectedDepartureDate: map['selectedDepatureDate'] as String,
      agentName: map['agentName'] as String,
      userName: map['userName'] as String,
      selectedBusClass: map['selectedBusClass'] as String,
      selectedSeatNo: map['selectedSeatNo'] as String,
      price: map['price'] as String,
      isUserBooked: map['isUserBooked'] as bool,
      isUserBookingComplete: map['isUserBookingComplete'] as bool,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  factory UserBookingModel.fromJson(String source) =>
      UserBookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserBookingModel(selectedOrigin: $selectedOrigin, selectedDestination: $selectedDestination, selectedPickupPoint: $selectedPickupPoint, selectedBusType: $selectedBusType, selectedDepatureTime: $selectedDepartureTime, selectedDepatureDate: $selectedDepartureDate, agentName: $agentName, userName: $userName, selectedBusClass: $selectedBusClass, selectedSeatNo: $selectedSeatNo, price: $price, isUserBooked: $isUserBooked, isUserBookingComplete: $isUserBookingComplete, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant UserBookingModel other) {
    if (identical(this, other)) return true;

    return other.selectedOrigin == selectedOrigin &&
        other.selectedDestination == selectedDestination &&
        other.selectedPickupPoint == selectedPickupPoint &&
        other.selectedBusType == selectedBusType &&
        other.selectedDepartureTime == selectedDepartureTime &&
        other.selectedDepartureDate == selectedDepartureDate &&
        other.agentName == agentName &&
        other.userName == userName &&
        other.selectedBusClass == selectedBusClass &&
        other.selectedSeatNo == selectedSeatNo &&
        other.price == price &&
        other.isUserBooked == isUserBooked &&
        other.isUserBookingComplete == isUserBookingComplete &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return selectedOrigin.hashCode ^
        selectedDestination.hashCode ^
        selectedPickupPoint.hashCode ^
        selectedBusType.hashCode ^
        selectedDepartureTime.hashCode ^
        selectedDepartureDate.hashCode ^
        agentName.hashCode ^
        userName.hashCode ^
        selectedBusClass.hashCode ^
        selectedSeatNo.hashCode ^
        price.hashCode ^
        isUserBooked.hashCode ^
        isUserBookingComplete.hashCode ^
        phoneNumber.hashCode;
  }
}
