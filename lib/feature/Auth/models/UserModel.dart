
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModelSocial extends Equatable {
  final String email;
  final String phone;
  final String name;
  final String? uId;
  final String image;
  final String cover;
  final String bio;
  final String password;
  final String birthDate;

  const UserModelSocial(
      {
        required this.email,
        required this.phone,
        required   this.name,
          this.uId,
        required this.image,
        required  this.bio,
        required  this.cover,
        required this.password,

        required  this.birthDate});

  static const non = UserModelSocial(
      email: "",
      phone: "",
      name: "",
      uId: "",
      image: "",
      bio: "",
      cover: "",
      password: "",
     birthDate: ""
  );

  Map<String, dynamic> toMap() {
    return {
      'email': email ,
      'phone': phone ,
      'name': name ,
      'uId': uId ,
      'image': image ,
      'cover': cover ,
      'bio': bio ,
      'password': password ,
      "birthDate":birthDate,
    };
  }

  factory UserModelSocial.fromMap(Map<String, dynamic> map) {
    return UserModelSocial(
      email: map['email'] as String,
      phone: map['phone'] as String,
      name: map['name'] as String,
      uId: map['uId'] as String,
      image: map['image'] as String,
      cover: map['cover'] as String,
      bio: map['bio'] as String,
      password: map['password'] as String,
      birthDate:map["birthDate"] as String,
    );
  }


   factory UserModelSocial.fromString(String user) =>
      UserModelSocial.fromMap(jsonDecode(user) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        email,
        phone,
        name,
        uId,
        image,
        cover,
        bio,
        password,
    birthDate,
      ];

  UserModelSocial copyWith({
    String? email,
    String? phone,
    String? name,
    String? uId,
    String? image,
    String? cover,
    String? bio,
    String? password,
    String? birthDate,
  }) {
    return UserModelSocial(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      uId: uId ?? this.uId,
      image: image ?? this.image,
      cover: cover ?? this.cover,
      bio: bio ?? this.bio,
      password: password ?? this.password,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
