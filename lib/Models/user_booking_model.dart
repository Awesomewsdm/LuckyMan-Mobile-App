// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserBookingModel {
  
  final String selectedDestination;
  final String selectedPickupPoint;
  final String selectedBusType;
  final String selectedDepatureTime;
  UserBookingModel({
    required this.selectedDestination,
    required this.selectedPickupPoint,
    required this.selectedBusType,
    required this.selectedDepatureTime,
  });
 

  UserBookingModel copyWith({
    String? selectedDestination,
    String? selectedPickupPoint,
    String? selectedBusType,
    String? selectedDepatureTime,
  }) {
    return UserBookingModel(
      selectedDestination: selectedDestination ?? this.selectedDestination,
      selectedPickupPoint: selectedPickupPoint ?? this.selectedPickupPoint,
      selectedBusType: selectedBusType ?? this.selectedBusType,
      selectedDepatureTime: selectedDepatureTime ?? this.selectedDepatureTime,
    );
  }

    toJson() {
    return {
      'selectedDestination': selectedDestination,
      'selectedPickupPoint': selectedPickupPoint,
      'selectedBusType': selectedBusType,
      'selectedDepatureTime': selectedDepatureTime,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedDestination': selectedDestination,
      'selectedPickupPoint': selectedPickupPoint,
      'selectedBusType': selectedBusType,
      'selectedDepatureTime': selectedDepatureTime,
    };
  }

  factory UserBookingModel.fromMap(Map<String, dynamic> map) {
    return UserBookingModel(
      selectedDestination: map['selectedDestination'] as String,
      selectedPickupPoint: map['selectedPickupPoint'] as String,
      selectedBusType: map['selectedBusType'] as String,
      selectedDepatureTime: map['selectedDepatureTime'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  factory UserBookingModel.fromJson(String source) => UserBookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserBookingModel(selectedDestination: $selectedDestination, selectedPickupPoint: $selectedPickupPoint, selectedBusType: $selectedBusType, selectedDepatureTime: $selectedDepatureTime)';
  }

  @override
  bool operator ==(covariant UserBookingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.selectedDestination == selectedDestination &&
      other.selectedPickupPoint == selectedPickupPoint &&
      other.selectedBusType == selectedBusType &&
      other.selectedDepatureTime == selectedDepatureTime;
  }

  @override
  int get hashCode {
    return selectedDestination.hashCode ^
      selectedPickupPoint.hashCode ^
      selectedBusType.hashCode ^
      selectedDepatureTime.hashCode;
  }
}
