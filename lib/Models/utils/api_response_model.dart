// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'api_data_model.dart';

class TransactionData {
    

    final String responseCode;
    final String status;
    final Data data;
  TransactionData({
    required this.responseCode,
    required this.status,
    required this.data,
  });


  TransactionData copyWith({
    String? responseCode,
    String? status,
    Data? data,
  }) {
    return TransactionData(
      responseCode: responseCode ?? this.responseCode,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'responseCode': responseCode,
      'status': status,
      'data': data.toMap(),
    };
  }

  factory TransactionData.fromMap(Map<String, dynamic> map) {
    return TransactionData(
      responseCode: map['responseCode'] as String,
      status: map['status'] as String,
      data: Data.fromMap(map['data'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionData.fromJson(String source) => TransactionData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TransactionData(responseCode: $responseCode, status: $status, data: $data)';

  @override
  bool operator ==(covariant TransactionData other) {
    if (identical(this, other)) return true;
  
    return 
      other.responseCode == responseCode &&
      other.status == status &&
      other.data == data;
  }

  @override
  int get hashCode => responseCode.hashCode ^ status.hashCode ^ data.hashCode;
}
