// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserBookingModel {
  final String selectedDestination;
  final String selectedPickupPoint;
  final String selectedBusType;
  final String selectedDepatureTime;
  final String selectedDepatureDate;
  final String agentName;
  final String userName;

  UserBookingModel({
    required this.selectedDestination,
    required this.selectedPickupPoint,
    required this.selectedBusType,
    required this.selectedDepatureTime,
    required this.selectedDepatureDate,
    required this.agentName,
    required this.userName,
  });

  UserBookingModel copyWith({
    String? selectedDestination,
    String? selectedPickupPoint,
    String? selectedBusType,
    String? selectedDepatureTime,
    String? selectedDepatureDate,
    String? agentName,
    String? userName,
  }) {
    return UserBookingModel(
      selectedDestination: selectedDestination ?? this.selectedDestination,
      selectedPickupPoint: selectedPickupPoint ?? this.selectedPickupPoint,
      selectedBusType: selectedBusType ?? this.selectedBusType,
      selectedDepatureTime: selectedDepatureTime ?? this.selectedDepatureTime,
      selectedDepatureDate: selectedDepatureDate ?? this.selectedDepatureDate,
      agentName: agentName ?? this.agentName,
      userName: userName ?? this.userName,
    );
  }

  toJson() {
    return {
      'selectedDestination': selectedDestination,
      'selectedPickupPoint': selectedPickupPoint,
      'selectedBusType': selectedBusType,
      'selectedDepatureTime': selectedDepatureTime,
      'selectedDepatureDate': selectedDepatureDate,
      'agentName': agentName,
      'userName': userName,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedDestination': selectedDestination,
      'selectedPickupPoint': selectedPickupPoint,
      'selectedBusType': selectedBusType,
      'selectedDepatureTime': selectedDepatureTime,
      'selectedDepatureDate': selectedDepatureDate,
      'agentName': agentName,
      'userName': userName,
    };
  }

  factory UserBookingModel.fromMap(Map<String, dynamic> map) {
    return UserBookingModel(
      selectedDestination: map['selectedDestination'] as String,
      selectedPickupPoint: map['selectedPickupPoint'] as String,
      selectedBusType: map['selectedBusType'] as String,
      selectedDepatureTime: map['selectedDepatureTime'] as String,
      selectedDepatureDate: map['selectedDepatureDate'] as String,
      agentName: map['agentName'] as String,
      userName: map['userName'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  factory UserBookingModel.fromJson(String source) =>
      UserBookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserBookingModel(selectedDestination: $selectedDestination, selectedPickupPoint: $selectedPickupPoint, selectedBusType: $selectedBusType, selectedDepatureTime: $selectedDepatureTime, selectedDepatureDate: $selectedDepatureDate, agentName: $agentName, userName: $userName)';
  }

  @override
  bool operator ==(covariant UserBookingModel other) {
    if (identical(this, other)) return true;

    return other.selectedDestination == selectedDestination &&
        other.selectedPickupPoint == selectedPickupPoint &&
        other.selectedBusType == selectedBusType &&
        other.selectedDepatureTime == selectedDepatureTime &&
        other.selectedDepatureDate == selectedDepatureDate &&
        other.agentName == agentName &&
        other.userName == userName;
  }

  @override
  int get hashCode {
    return selectedDestination.hashCode ^
        selectedPickupPoint.hashCode ^
        selectedBusType.hashCode ^
        selectedDepatureTime.hashCode ^
        selectedDepatureDate.hashCode ^
        agentName.hashCode ^
        userName.hashCode;
  }
}
