import 'package:firebase_auth/firebase_auth.dart';

import '../../../service/components.dart';
import '../models/UserModel.dart';
import 'AuthData.dart';

class AuthRepository {
  final authData = AuthData();
  Future<String?> registerWithEmailAndPasswordRepo({
    required UserModelSocial userModelSocial,
  }) async {
    try {
      final response = await authData.registerWithEmailAndPassword(
          userModelSocial: userModelSocial);
      return response!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        print(e.code);
        return "البريد الإلكتروني مستخدم بالفعل";
      } else {
        print(e.message);
        return e.message;
      }
    }
  }

  Future<UserModelSocial?> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await authData.loginWithEmailAndPassword1(
          email: email, password: password);
      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowToast(
            stute: ToustStute.ERROR,
            text: 'لم يتم العثور على مستخدم لهذا البريد الإلكتروني.');
      } else if (e.code == 'wrong-password') {
        ShowToast(stute: ToustStute.ERROR, text: 'كلمه السر غلط ي وحش 😂');
      }
    }
  }
}
