// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class SeatListModel {
  List<dynamic> seatList;
  SeatListModel({
    required this.seatList,
  });

  factory SeatListModel.fromSnaphot(
      DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final data = snapshot.data()!;
    return SeatListModel(
       seatList: data["Accra"],
    );
  }

  SeatListModel copyWith({
    List<dynamic>? seatList,
  }) {
    return SeatListModel(
      seatList: seatList ?? this.seatList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seatList': seatList,
    };
  }

  toJson() {
    return {
      'seatList': seatList,
    };
  }


  factory SeatListModel.fromMap(Map<String, dynamic> map) {
    return SeatListModel(
        seatList: List<dynamic>.from(
      (map['seatList'] as List<dynamic>),
    ));
  }

  factory SeatListModel.fromJson(String source) =>
      SeatListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SeatListModel(seatList: $seatList)';

  @override
  bool operator ==(covariant SeatListModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.seatList, seatList);
  }

  @override
  int get hashCode => seatList.hashCode;
}
