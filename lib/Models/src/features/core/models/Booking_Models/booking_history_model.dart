// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BookingHistoryData {
  final String selectedOrigin;
  final String selectedDestination;
  final String selectedBusType;
  final String selectedSeatNo;
  final String price;
  final String? id;
  final String selectedDepatureDate;
  final String selectedDepatureTime;
  BookingHistoryData({
    required this.selectedOrigin,
    required this.selectedDestination,
    required this.selectedBusType,
    required this.selectedSeatNo,
    required this.price,
    this.id,
    required this.selectedDepatureDate,
    required this.selectedDepatureTime,
  });

  BookingHistoryData copyWith({
    String? selectedOrigin,
    String? selectedDestination,
    String? selectedBusType,
    String? selectedSeatNo,
    String? price,
    String? id,
    String? selectedDepatureDate,
    String? selectedDepatureTime,
  }) {
    return BookingHistoryData(
      selectedOrigin: selectedOrigin ?? this.selectedOrigin,
      selectedDestination: selectedDestination ?? this.selectedDestination,
      selectedBusType: selectedBusType ?? this.selectedBusType,
      selectedSeatNo: selectedSeatNo ?? this.selectedSeatNo,
      price: price ?? this.price,
      id: id ?? this.id,
      selectedDepatureDate: selectedDepatureDate ?? this.selectedDepatureDate,
      selectedDepatureTime: selectedDepatureTime ?? this.selectedDepatureTime,
    );
  }

  factory BookingHistoryData.fromSnaphot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BookingHistoryData(
      id: document.id,
      selectedSeatNo: data["selectedSeatNo"],
      selectedBusType: data["selectedBusType"],
      selectedDestination: data["selectedDestination"],
      price: data["price"],
      selectedDepatureDate: data["selectedDepatureDate"],
      selectedDepatureTime: data["selectedDepatureTime"],
      selectedOrigin: data["selectedOrigin"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedOrigin': selectedOrigin,
      'selectedDestination': selectedDestination,
      'selectedBusType': selectedBusType,
      'selectedSeatNo': selectedSeatNo,
      'price': price,
      'id': id,
      'selectedDepatureDate': selectedDepatureDate,
      'selectedDepatureTime': selectedDepatureTime,
    };
  }

  factory BookingHistoryData.fromMap(Map<String, dynamic> map) {
    return BookingHistoryData(
      selectedOrigin: map['selectedOrigin'] as String,
      selectedDestination: map['selectedDestination'] as String,
      selectedBusType: map['selectedBusType'] as String,
      selectedSeatNo: map['selectedSeatNo'] as String,
      price: map['price'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      selectedDepatureDate: map['selectedDepatureDate'] as String,
      selectedDepatureTime: map['selectedDepatureTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingHistoryData.fromJson(String source) =>
      BookingHistoryData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingHistoryData(selectedOrigin: $selectedOrigin, selectedDestination: $selectedDestination, selectedBusType: $selectedBusType, selectedSeatNo: $selectedSeatNo, price: $price, id: $id, selectedDepatureDate: $selectedDepatureDate, selectedDepatureTime: $selectedDepatureTime)';
  }

  @override
  bool operator ==(covariant BookingHistoryData other) {
    if (identical(this, other)) return true;

    return other.selectedOrigin == selectedOrigin &&
        other.selectedDestination == selectedDestination &&
        other.selectedBusType == selectedBusType &&
        other.selectedSeatNo == selectedSeatNo &&
        other.price == price &&
        other.id == id &&
        other.selectedDepatureDate == selectedDepatureDate &&
        other.selectedDepatureTime == selectedDepatureTime;
  }

  @override
  int get hashCode {
    return selectedOrigin.hashCode ^
        selectedDestination.hashCode ^
        selectedBusType.hashCode ^
        selectedSeatNo.hashCode ^
        price.hashCode ^
        id.hashCode ^
        selectedDepatureDate.hashCode ^
        selectedDepatureTime.hashCode;
  }
}
