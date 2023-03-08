// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BookingMenuItems {
  List<String> busType;
  List<String> busClass;
  List<String> destinations;
  List<String> departureDate;
  List<String> departureTime;
  List<String> pickupPoints;
  List<String> agents;
  BookingMenuItems({
    required this.busType,
    required this.busClass,
    required this.destinations,
    required this.departureDate,
    required this.departureTime,
    required this.pickupPoints,
    required this.agents,
  });

  factory BookingMenuItems.fromSnaphot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BookingMenuItems(
        agents: data["Agents"],
        busClass: data [" Bus Classes"],
        busType: data["Bus Types"],
        departureDate: data["Departure Dates"],
        departureTime: data["Departure Times"],
        destinations: data["destinations"],
        pickupPoints: data["Pickup Points"]);
  }

  BookingMenuItems copyWith({
    List<String>? busType,
    List<String>? busClass,
    List<String>? destinations,
    List<String>? departureDate,
    List<String>? departureTime,
    List<String>? pickupPoints,
    List<String>? agents,
  }) {
    return BookingMenuItems(
      busType: busType ?? this.busType,
      busClass: busClass ?? this.busClass,
      destinations: destinations ?? this.destinations,
      departureDate: departureDate ?? this.departureDate,
      departureTime: departureTime ?? this.departureTime,
      pickupPoints: pickupPoints ?? this.pickupPoints,
      agents: agents ?? this.agents,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'busType': busType,
      'busClass': busClass,
      'destinations': destinations,
      'departureDate': departureDate,
      'departureTime': departureTime,
      'pickupPoints': pickupPoints,
      'agents': agents,
    };
  }

  toJson() {
    return {
      'busType': busType,
      'busClass': busClass,
      'destinations': destinations,
      'departureDate': departureDate,
      'departureTime': departureTime,
      'pickupPoints': pickupPoints,
      'agents': agents,
    };
  }

  factory BookingMenuItems.fromMap(Map<String, dynamic> map) {
    return BookingMenuItems(
        busType: List<String>.from(
          (map['busType'] as List<String>),
        ),
        busClass: List<String>.from(
          (map['busClass'] as List<String>),
        ),
        destinations: List<String>.from(
          (map['destinations'] as List<String>),
        ),
        departureDate: List<String>.from(
          (map['departureDate'] as List<String>),
        ),
        departureTime: List<String>.from(
          (map['departureTime'] as List<String>),
        ),
        pickupPoints: List<String>.from(
          (map['pickupPoints'] as List<String>),
        ),
        agents: List<String>.from(
          (map['agents'] as List<String>),
        ));
  }

  factory BookingMenuItems.fromJson(String source) =>
      BookingMenuItems.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingMenuItems(busType: $busType, busClass: $busClass, destinations: $destinations, departureDate: $departureDate, departureTime: $departureTime, pickupPoints: $pickupPoints, agents: $agents)';
  }

  @override
  bool operator ==(covariant BookingMenuItems other) {
    if (identical(this, other)) return true;

    return listEquals(other.busType, busType) &&
        listEquals(other.busClass, busClass) &&
        listEquals(other.destinations, destinations) &&
        listEquals(other.departureDate, departureDate) &&
        listEquals(other.departureTime, departureTime) &&
        listEquals(other.pickupPoints, pickupPoints) &&
        listEquals(other.agents, agents);
  }

  @override
  int get hashCode {
    return busType.hashCode ^
        busClass.hashCode ^
        destinations.hashCode ^
        departureDate.hashCode ^
        departureTime.hashCode ^
        pickupPoints.hashCode ^
        agents.hashCode;
  }
}
