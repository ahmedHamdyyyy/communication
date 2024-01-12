import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../service/components.dart';
import '../data/AuthData.dart';
import '../data/repository.dart';
import '../models/UserModel.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());
 final authRepository=  AuthRepository();
  final authData = AuthData();
  void pickImage(String image) => emit(state.copyWith(imagePath: image));
  void get clearImage => emit(state.copyWith(imagePath: ''));
  void get initRegister =>
      emit(state.copyWith(userRegestStat: MyStatus.initial));
  String get getImage => state.imagePath;
  Future<Uint8List> getPath(String path) async => await File(path).readAsBytes();





  void registerUser({
    required UserModelSocial userModelSocial,
  }) async {
      emit(state.copyWith(userRegestStat: MyStatus.loading));
       final uId = await authRepository.
       registerWithEmailAndPasswordRepo(
           userModelSocial:userModelSocial);
       if(uId !="البريد الإلكتروني مستخدم بالفعل"){

         print(uId);
         emit(state.copyWith(
             uId: uId ,
             userRegestStat: MyStatus.success,
             message: "جار تسجيل الدخول بنجاح استمتع ياعم.😉🍁"));
       }else {
         emit(state.copyWith(
           userRegestStat: MyStatus.failure,message: uId ));
       }


  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(
      userLogin: MyStatus.loading,
    ));
    final response = await authRepository.loginWithEmailAndPassword(
        email: email, password: password);
    if (response != null) {
      emit(state.copyWith(
        userModelSocial: response,
        userLogin: MyStatus.success,
      ));
    } else {
      emit(state.copyWith(
        userLogin: MyStatus.failure,
      ));
    }
  }

  void pickImageUser({required ImageSource source}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      emit(state.copyWith(imagePath: pickedFile.path));
      print(pickedFile.path);
    }
  }


}

