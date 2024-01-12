import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../service/Cache.dart';
import '../../../constant/color_constant.dart';
import '../models/UserModel.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AuthData {
  final auth = FirebaseAuth.instance;
  final firestor = FirebaseFirestore.instance;

  Future<User?> registerWithEmailAndPassword(
      {required UserModelSocial userModelSocial}) async {
    final response = await auth.createUserWithEmailAndPassword(
      email: userModelSocial.email,
      password: userModelSocial.password,
    );
    final userModel = UserModelSocial(
        email: userModelSocial.email,
        uId: response.user!.uid,
        name: userModelSocial.name,
        phone: userModelSocial.phone,
        password: userModelSocial.password,
        image: userModelSocial.image != ""
            ? await uploadImage(userModelSocial.image)
            : "",
        birthDate: userModelSocial.birthDate,
        bio: '',
        cover: '');
    userCreatedFirestore(userModel);
    return response.user;
  }

  Future<void> userCreatedFirestore(
    UserModelSocial userModelSocial,
  ) async {
    await firestor
        .collection(users)
        .doc(userModelSocial.uId)
        .set(userModelSocial.toMap());
  }

  Future<String> uploadImage(String path) async {
    final value = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child("ImageProfile/${Uri.file(path).pathSegments.last}")
        .putFile(File(path));

    return value.ref.getDownloadURL();
  }

  Future<UserModelSocial> loginWithEmailAndPassword1(
      {required String email, required String password}) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final userSnapshot = await getUserLogin(userCredential.user!.uid);
    final userModel = UserModelSocial.fromMap(userSnapshot.data()!);
    SharedPreferencesHelper.saveString("user", jsonEncode(userModel.toMap()));

    return userModel;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserLogin(
      String uId) async {
    return await firestor.collection(users).doc(uId).get();
  }
}
