import 'package:equatable/equatable.dart';
import '../../../service/components.dart';
import '../models/UserModel.dart';

class AuthState extends Equatable {
  final MyStatus userRegestStat;
  final MyStatus userLogin;
  final MyStatus getUserImage;


  final UserModelSocial userModelSocial;

  final String imagePath;
  final String message;
  final String uId;

  const AuthState({
    this.userRegestStat = MyStatus.initial,
    this.getUserImage = MyStatus.initial,
    this.userLogin = MyStatus.initial,
    this.message = "",
    this.userModelSocial = UserModelSocial.non,
    this.imagePath = "",
    this.uId = "",
  });
  AuthState copyWith({
    MyStatus? userRegestStat,
    MyStatus? getUser,
    UserModelSocial? userModelSocial,
    MyStatus? userLogin,
    MyStatus? getUserImage,
    String? message,
    String? uId,
    String? imagePath,
  }) {
    return AuthState(
        userLogin: userLogin ?? this.userLogin,
        userRegestStat: userRegestStat ?? this.userRegestStat,
        message: message ?? this.message,
        uId: uId ?? this.uId,
        userModelSocial: userModelSocial ?? this.userModelSocial,
        imagePath: imagePath ?? this.imagePath,
        getUserImage: getUserImage ?? this.getUserImage);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        userLogin,
        uId,
        userRegestStat,
        message,
        imagePath,
        userModelSocial,
        getUserImage,
      ];
}
