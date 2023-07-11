// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String email;
  String phoneNumber;
  String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.uid,
  });

  // from map (We are getting data from Server)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  // to map (Sending the data to the server)
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
    };
  }
}
