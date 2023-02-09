// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? studentID;
  final String? phoneNumber;
  final String? password;
  final String? seatNo; 
  final String? price;
  final String? depatureTime;
  final String? depatureDate;
  final String? agentName;
  final String? destination;
  final String? pickupPoint;
  
  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.studentID,
    this.phoneNumber,
    this.password,
    this.seatNo,
    this.price,
    this.depatureTime,
    this.depatureDate,
    this.agentName,
    this.destination,
    this.pickupPoint,
    
  });
 
  

  factory UserModel.fromSnaphot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data["fullName"],
      email: data["email"],
      phoneNumber: data["phoneNumber"],
      password: data["password"],
      studentID: data["studentID"],
      destination: data["destination"],
      price: data["price"],
      seatNo: data["seatNo"],
      depatureDate: data["depatureDate"],
      depatureTime: data["depatureTime"],
      pickupPoint: data["pickupPoint"],
      agentName: data["agentName"],
    );
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? studentID,
    String? phoneNumber,
    String? password,
    String? seatNo,
    String? price,
    String? depatureTime,
    String? depatureDate,
    String? agentName,
    String? destination,
    String? pickupPoint,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      studentID: studentID ?? this.studentID,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      seatNo: seatNo ?? this.seatNo,
      price: price ?? this.price,
      depatureTime: depatureTime ?? this.depatureTime,
      depatureDate: depatureDate ?? this.depatureDate,
      agentName: agentName ?? this.agentName,
      destination: destination ?? this.destination,
      pickupPoint: pickupPoint ?? this.pickupPoint,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'studentID': studentID,
      'phoneNumber': phoneNumber,
      'password': password,
      'seatNo': seatNo,
      'price': price,
      'depatureTime': depatureTime,
      'depatureDate': depatureDate,
      'agentName': agentName,
      'destination': destination,
      'pickupPoint': pickupPoint,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      studentID: map['studentID'] != null ? map['studentID'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      seatNo: map['seatNo'] != null ? map['seatNo'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      depatureTime: map['depatureTime'] != null ? map['depatureTime'] as String : null,
      depatureDate: map['depatureDate'] != null ? map['depatureDate'] as String : null,
      agentName: map['agentName'] != null ? map['agentName'] as String : null,
      destination: map['destination'] != null ? map['destination'] as String : null,
      pickupPoint: map['pickupPoint'] != null ? map['pickupPoint'] as String : null,
    );
  }

   toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, studentID: $studentID, phoneNumber: $phoneNumber, password: $password, seatNo: $seatNo, price: $price, depatureTime: $depatureTime, depatureDate: $depatureDate, agentName: $agentName, destination: $destination, pickupPoint: $pickupPoint)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.fullName == fullName &&
      other.email == email &&
      other.studentID == studentID &&
      other.phoneNumber == phoneNumber &&
      other.password == password &&
      other.seatNo == seatNo &&
      other.price == price &&
      other.depatureTime == depatureTime &&
      other.depatureDate == depatureDate &&
      other.agentName == agentName &&
      other.destination == destination &&
      other.pickupPoint == pickupPoint;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fullName.hashCode ^
      email.hashCode ^
      studentID.hashCode ^
      phoneNumber.hashCode ^
      password.hashCode ^
      seatNo.hashCode ^
      price.hashCode ^
      depatureTime.hashCode ^
      depatureDate.hashCode ^
      agentName.hashCode ^
      destination.hashCode ^
      pickupPoint.hashCode;
  }
  }
