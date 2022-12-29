// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String? id;
  final String fullNmae;
  final String email;
  final String studentID;
  final String phoneNumber;
  final String password;
  UserModel({
    this.id,
    required this.fullNmae,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.studentID,
  });

  toJson() {
    return <String, dynamic>{
      'id': id,
      'fullNmae': fullNmae,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
