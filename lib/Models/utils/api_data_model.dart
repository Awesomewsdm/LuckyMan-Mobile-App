// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Data {
  final String checkoutUrl;
  final String checkoutId;
  final String clientReference;
  final String message;
  final String checkoutDirectUrl;
  Data({
    required this.checkoutUrl,
    required this.checkoutId,
    required this.clientReference,
    required this.message,
    required this.checkoutDirectUrl,
  });

   

  Data copyWith({
    String? checkoutUrl,
    String? checkoutId,
    String? clientReference,
    String? message,
    String? checkoutDirectUrl,
  }) {
    return Data(
      checkoutUrl: checkoutUrl ?? this.checkoutUrl,
      checkoutId: checkoutId ?? this.checkoutId,
      clientReference: clientReference ?? this.clientReference,
      message: message ?? this.message,
      checkoutDirectUrl: checkoutDirectUrl ?? this.checkoutDirectUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'checkoutUrl': checkoutUrl,
      'checkoutId': checkoutId,
      'clientReference': clientReference,
      'message': message,
      'checkoutDirectUrl': checkoutDirectUrl,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      checkoutUrl: map['checkoutUrl'] as String,
      checkoutId: map['checkoutId'] as String,
      clientReference: map['clientReference'] as String,
      message: map['message'] as String,
      checkoutDirectUrl: map['checkoutDirectUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(checkoutUrl: $checkoutUrl, checkoutId: $checkoutId, clientReference: $clientReference, message: $message, checkoutDirectUrl: $checkoutDirectUrl)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;
  
    return 
      other.checkoutUrl == checkoutUrl &&
      other.checkoutId == checkoutId &&
      other.clientReference == clientReference &&
      other.message == message &&
      other.checkoutDirectUrl == checkoutDirectUrl;
  }

  @override
  int get hashCode {
    return checkoutUrl.hashCode ^
      checkoutId.hashCode ^
      clientReference.hashCode ^
      message.hashCode ^
      checkoutDirectUrl.hashCode;
  }
}
