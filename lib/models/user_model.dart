import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String name;
  String image;
  Timestamp date;
  String uid;
  String role;
  String telephone;
  String fcmToken;

  UserModel({
    required this.email,
    required this.name,
    required this.image,
    required this.date,
    required this.uid,
    required this.role,
    required this.telephone,
    required this.fcmToken,
  });

  factory UserModel.fromJson(DocumentSnapshot snapshot) {
    return UserModel(
      email: snapshot['email'],
      name: snapshot['name'],
      image: snapshot['image'],
      date: snapshot['date'],
      uid: snapshot['uid'],
      role: snapshot['role'],
      telephone: snapshot['telephone'],
      fcmToken: snapshot['fcmToken'],
    );
  }
}
