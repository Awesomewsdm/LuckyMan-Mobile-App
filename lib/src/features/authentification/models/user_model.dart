// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String studentID;
  final String phoneNumber;
  final String password;
  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.studentID,
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
}
