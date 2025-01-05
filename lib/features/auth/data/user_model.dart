import 'package:firebase_auth/firebase_auth.dart';

import '../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name, required super.uid});

  factory UserModel.fromUser(User user) => UserModel(
        email: user.email!,
        name: user.displayName,
        uid: user.uid,
      );

  factory UserModel.fromDocument(Map<String, dynamic> document) => UserModel(
        email: document['email'],
        name: document['name'],
        uid: document['uid'],
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        uid: json['uid'],
      );

  // it will be used only whily write or add data to firestore
  factory UserModel.fromUserEntity(UserEntity user) => UserModel(
        email: user.email,
        name: user.name,
        uid: user.uid,
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}
