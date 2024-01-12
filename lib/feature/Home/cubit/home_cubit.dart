import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../service/components.dart';
import '../../Auth/models/UserModel.dart';
import '../../../service/Cache.dart';
import '../../../constant/color_constant.dart';
import '../data/MyData.dart';
import '../data/repository.dart';
import '../models/MessageModel.dart';
import '../models/comments.dart';
import '../models/postModels.dart';

import 'home_state.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final repo = HomeRepository();
  MyData myData = MyData();
  String get getCurrentLang => state.currentLang;
  int get getCurrentTheme => state.currentTheme;

  void getLanguage() async {
    final currant = SharedPreferencesHelper.getString("languageCode");
    emit(state.copyWith(currentLang: currant));
  }

  void getTheme() async {
    final currant = await SharedPreferencesHelper.getInt("currentTheme");
    emit(state.copyWith(currentTheme: currant));
  }
  void deleteTheme()async  {
    final currant = await SharedPreferencesHelper.remove("currentTheme");
    emit(state.copyWith(currentTheme: 0));
  }

  Future<void> setLanguage({required String languageCode}) async {
    emit(state.copyWith(langState: MyStatus.loading));
    await SharedPreferencesHelper.saveString("languageCode", languageCode);
    emit(state.copyWith(
      currentLang: languageCode,
    ));
  }

  Future<void> setTheme({required int currentTheme}) async {
    emit(state.copyWith(langState: MyStatus.loading));
    await SharedPreferencesHelper.saveInt("currentTheme", currentTheme);
    emit(state.copyWith(
      currentTheme: currentTheme,
    ));
  }



  changeIcon({required int currentIndex}) {
    emit(state.copyWith(
      currentIndex: currentIndex,
    ));
  }

  UserModelSocial? userMode;
  void getMyDataFromCach() async {
    userMode = await myData.getMyData();
    if (userMode != null) {
      emit(state.copyWith(
          getMyData: MyStatus.success, myDataModelSocial: userMode));
    } else {
      emit(state.copyWith(getMyData: MyStatus.failure));
    }
  }

  void logOut() async {
    emit(state.copyWith(logOutState: MyStatus.loading));
    await FirebaseAuth.instance.signOut().then((value) async {
      await SharedPreferencesHelper.remove("user").then((value) {
        emit(state.copyWith(logOutState: MyStatus.success));
      });
    }).catchError((e) {
      print(e.toString());
      emit(state.copyWith(logOutState: MyStatus.failure));
    });
  }

  void pickImage(String image) => emit(state.copyWith(imagePath: image));

  void createPost({
    required String text,
    required String dateTime,
    String? imagePost,
  }) async {
    emit(state.copyWith(createPostState: MyStatus.loading));
    PostModel model = PostModel(
      name: state.myDataModelSocial.name,
      uId: state.myDataModelSocial.uId!,
      text: text,
      postId: "",
      likes: const [],
      image: state.myDataModelSocial.image,
      dateTime: dateTime,
      postImage: imagePost != "" ? await uploadPostImage1(imagePost!) : "",
    );
    try {
      await FirebaseFirestore.instance
          .collection("posts")
          .add(model.toMap())
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("posts")
            .doc(value.id)
            .update({"postId": value.id});
        emit(state.copyWith(
            createPostState: MyStatus.success,
            postModel: model.copyWith(postId: value.id)));
        print(value.id);
      });

      emit(state.copyWith(
        createPostState: MyStatus.success,
        postModel: model,
      ));
    } catch (e) {
      emit(state.copyWith(createPostState: MyStatus.failure));
    }
  }


  void getAllComments(String postId) async {
    emit(state.copyWith(getCommentsUserState: MyStatus.loading));

    try {
      final comments = await myData.getAllComments(postId);
      if (comments!.isNotEmpty) {
        emit(state.copyWith(
            comments: comments, getCommentsUserState: MyStatus.success));
      } else {
        emit(state.copyWith(getCommentsUserState: MyStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(getCommentsUserState: MyStatus.failure));
    }
  }

  List<MessageModel> messagesList = [];
  void getMessages({
    required String receiverId,
    required String senderId,
  }) async {
    emit(state.copyWith(getMessagesUserState: MyStatus.loading));

    try {
      FirebaseFirestore.instance
          .collection(users)
          .doc(senderId)
          .collection(chats)
          .doc(receiverId)
          .collection("messages")
          .orderBy(
            "dateTime",
          )
          .snapshots()
          .listen((event) {
        messagesList.clear();
        for (var element in event.docs) {
          messagesList.add(MessageModel.fromJson(element.data()));
        }
      });
      emit(state.copyWith(
          getMessagesUserState: MyStatus.success, messages: messagesList));
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(getMessagesUserState: MyStatus.failure));
    }
  }

  void sendMessage({
    required String receiverId,
    required String text,
    required String timestamp,
    required String senderId,
  }) async {
    try {
      emit(state.copyWith(createMessageState: MyStatus.loading));

      MessageModel model = MessageModel(
        text: text,
        senderId: senderId,
        timestamp: timestamp,
        receiverId: receiverId,
      );

      CollectionReference senderChatCollection = FirebaseFirestore.instance
          .collection(users)
          .doc(receiverId)
          .collection(chats)
          .doc(senderId)
          .collection("messages");

      CollectionReference receiverChatCollection = FirebaseFirestore.instance
          .collection(users)
          .doc(senderId)
          .collection(chats)
          .doc(receiverId)
          .collection("messages");

      await senderChatCollection.add(model.toMap());
      await receiverChatCollection.add(model.toMap());
      emit(state.copyWith(createMessageState: MyStatus.success));

    } catch (error) {
      emit(state.copyWith(createMessageState: MyStatus.failure));
    }
  }

  Future<String> uploadPostImage1(
    String path,
  ) async {
    final value = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child("posts/${Uri.file(path).pathSegments.last}")
        .putFile(File(path));
    return value.ref.getDownloadURL();
  }

  void pickImagePosts({
    required ImageSource source,
  }) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      emit(state.copyWith(imagePath: pickedFile.path));
      print(pickedFile.path);
    }
  }

  Future<Uint8List> getPath(String path) async =>
      await File(path).readAsBytes();

  void getAllPosts() async {
    emit(state.copyWith(getAllPostsState: MyStatus.loading));

    try {
      final Stream<List<PostModel>> postsStream = myData.getAllPosts();

      postsStream.listen((List<PostModel> posts) {
        emit(state.copyWith(
          posts: posts,
          getAllPostsState: MyStatus.success,
          message: "جار تحميل جميع البوستات.",
        ));
      });
    } catch (error) {
      emit(state.copyWith(getAllPostsState: MyStatus.failure));
    }
  }

  void getAllUser() async {
    emit(state.copyWith(getAllUsersState: MyStatus.loading));
    final users = await myData.getAllUsers();
    if (users.isNotEmpty) {
      emit(state.copyWith(
          users: users,
          getAllUsersState: MyStatus.success,
          message: "جار تحميل جميع المستخدمين."));
    } else {
      emit(state.copyWith(getAllUsersState: MyStatus.failure));
    }
  }

  void getUserData(String uId) async {
    emit(state.copyWith(getUserInfo: MyStatus.loading));
    final user = await myData.getUserData(uId);
    if (user != null) {
      emit(state.copyWith(
        getUserInfo: MyStatus.success,
        userModelSocial: user,
      ));
    } else {
      emit(state.copyWith(getUserInfo: MyStatus.failure));
    }
  }

  void getUserPosts(String uId) async {
    emit(state.copyWith(getPostsUserState: MyStatus.loading));
    try {
      final user = await myData.getUserPosts(uId);
      if (user.isNotEmpty) {
        emit(state.copyWith(
          getPostsUserState: MyStatus.success,
          postsUser: user,
        ));
      } else {
        emit(state.copyWith(getPostsUserState: MyStatus.failure));
      }
    } catch (e) {
      print(e.toString());
    }
  }


  void createComment(
    CommentModel commentModel,
  ) async {
    try {
      emit(state.copyWith(createCommentState: MyStatus.loading));

      FirebaseFirestore.instance
          .collection("posts")
          .doc(commentModel.postId)
          .collection("comments")
          .add(
            commentModel.toMap(),
          );

      emit(state.copyWith(createCommentState: MyStatus.success));

      print("نجح");
    } catch (e) {
      emit(state.copyWith(createCommentState: MyStatus.failure));
      print("فشل");
      print(e.toString());
      print("فشل");
    }
  }

}
