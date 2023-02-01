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

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.studentID,
    this.phoneNumber,
    this.password,
  });

  toJson() {
    return {
      'fullName': fullName,
      'studentID': studentID,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

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
    );
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? studentID,
    String? phoneNumber,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      studentID: studentID ?? this.studentID,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
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
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      studentID: map['studentID'] as String,
      phoneNumber: map['phoneNumber'] as String,
      password: map['password'] as String,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, studentID: $studentID, phoneNumber: $phoneNumber, password: $password,)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.email == email &&
        other.studentID == studentID &&
        other.phoneNumber == phoneNumber &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        studentID.hashCode ^
        phoneNumber.hashCode ^
        password.hashCode;
  }
}
