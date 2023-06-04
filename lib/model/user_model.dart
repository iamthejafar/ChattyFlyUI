import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel {
  String? firstname;
  String? lastname;
  String? status;
  String? email;
  String? uid;
  bool? isOnline;
  String? profilepic;

  UserModel({
    this.firstname,
    this.lastname,
    this.status,
    this.email,
    this.uid,
    this.isOnline,
    this.profilepic
  });

  factory UserModel.fromFirestore(AsyncSnapshot snapshot) {
    Map<String,dynamic> data = snapshot.data()! as Map<String,dynamic>;
    return UserModel(
      firstname: data['firstname'] ?? '',
      lastname: data['lastname'] ?? '',
      status: data['status'] ?? '',
      email: data['email'] ?? '',
      uid: data['uid'] ?? '',
      profilepic: data['profilepic'] ?? '',
      isOnline: data['isOnline'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'status': status,
      'email': email,
      'uid': uid,
      'profilepic': profilepic,
      'isOnline': isOnline,
    };
  }
}
