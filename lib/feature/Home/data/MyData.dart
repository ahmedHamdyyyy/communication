import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../Auth/models/UserModel.dart';
import '../../../service/Cache.dart';
import '../../../constant/color_constant.dart';
import '../models/MessageModel.dart';
import '../models/comments.dart';
import '../models/postModels.dart';

class MyData {
  Future<UserModelSocial?> getMyData() async {
    final String? jsonString = await SharedPreferencesHelper.getString1("user");
    if (jsonString != null) {
      return UserModelSocial.fromString(jsonString);
    } else {
      return null;
    }
  }
  Stream<List<PostModel>> getAllPosts() {
    return FirebaseFirestore.instance
        .collection(posts)
        .orderBy('dateTime', descending: true)
        .snapshots()
        .map((event) {
      List<PostModel> list = [];
      for (var element in event.docs) {
        list.add(PostModel.fromMap(element.data()));
      }
      return list;
    });
  }
        deletePost2({required String postId,}){
 final response=  FirebaseFirestore.instance.
 collection("posts").doc(postId).delete();



    
 }
  Future<String> deletePost({required String postId,
    required String userId}) async {
    final postRef = FirebaseFirestore.instance.collection("posts").doc(postId);
    final postSnapshot = await postRef.get();
    if (postSnapshot.exists) {
      final postData = postSnapshot.data() as Map<String, dynamic>;
      final postOwnerId = postData['uId'] as String;

      if (postOwnerId == userId) {
        await postRef.delete();
        return "delete successful";
      } else {
        throw Exception("You don't have permission to delete this post.");
      }
    } else {
      throw Exception("Post not found.");
    }
  }
  Future<List<UserModelSocial>> getAllUsers() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection(users).get();
      var data = snapshot.docs.map((doc) {
        return UserModelSocial.fromMap(doc.data());
      }).toList();

      return data;
    } catch (error) {
      // Handle the error appropriately
      print('Error retrieving posts: $error');
      return [];
    }
  }

  Future<UserModelSocial?> getUserData(String uId) async {
    final data =
        await FirebaseFirestore.instance.collection(users).doc(uId).get();
    if (data.data() != null) {
      final user = UserModelSocial.fromMap(data.data()!);
      return user;
    } else {
      return null;
    }
  }

  Future<List<PostModel>> getUserPosts(String uId) async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection(posts)
          .where('uId', isEqualTo: uId)
          .get();
      var postsList = snapshot.docs.map((doc) {
        return PostModel.fromMap(doc.data());
      }).toList();
      return postsList;
    } catch (error) {

      print('Error retrieving posts: $error');
      return [];
    }
  }

  Future<List<CommentModel>?> getAllComments(String postId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .orderBy('dateTime', descending: false)
          .get();
      List<CommentModel> data = snapshot.docs.map((doc) {
        return CommentModel.fromMap(doc.data());
      }).toList();

      print(data.length);
      return data;
    } catch (error) {
      if (kDebugMode) {
        print('Error retrieving comments: $error');
      }
      rethrow; }
  }

  Future<List<MessageModel>?> getAllMessages(
      {required String receiverId, required String senderId}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(senderId)
              .collection('chats')
              .doc(receiverId)
              .collection('messages')
              .orderBy(
                'dateTime',
                descending: false,
              )
              .get();

      List<MessageModel> messages = snapshot.docs
          .map((doc) => MessageModel.fromJson(doc.data()))
          .toList();
      print(messages.length);
      return messages;
    } catch (error) {
      print('Failed to retrieve messages: $error');
      return null;
    }
  }


}

























/*  void createPost({
    required String text,
    required String dateTime,
    String? postImage,
    String? postId,
  }) async {
    emit(state.copyWith(createPostState: MyStatus.loading));

    PostModel model = PostModel(
      name: state.userModelSocial.name,
      uId: state.userModelSocial.uId,
      text: text,
      postId: postId,
      image: state.userModelSocial.image,
      dateTime: dateTime,
      postImage: postImage,
    );
    await FirebaseFirestore.instance
        .collection("posts")
        .add(model.toMap())
        .then((value) {
      emit(state.copyWith(
        createPostState: MyStatus.success,
      ));

      print("نااااااااااحج");
    }).catchError((e) {
      emit(state.copyWith(createPostState: MyStatus.failure));
      print("فشلللللللللللللل");
      print(e.toString());
    });
  }*/
/*
Future<List<MessageModel>> getAllMessagesd({
  required String receiverId,
  required String senderId,
}) async {
  Completer<List<MessageModel>> completer = Completer<List<MessageModel>>();

  try {
    List<MessageModel> messages = [];

    Stream<QuerySnapshot> receiverStream = FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(senderId)
        .collection('messages')
        .orderBy('dateTime', descending: true)
        .snapshots();

    Stream<QuerySnapshot> senderStream = FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime', descending: true)
        .snapshots();

    StreamSubscription receiverSubscription = receiverStream.listen((event) {
      List<MessageModel> receiverMessages = event.docs
          .map((element) => MessageModel.fromJson(element.data() as Map<String, dynamic> ))
          .toList();
      messages.addAll(receiverMessages);
    });

    StreamSubscription senderSubscription = senderStream.listen((event) {
      List<MessageModel> senderMessages = event.docs
          .map((element) => MessageModel.fromJson(element.data()as Map<String, dynamic>))
          .toList();
      messages.addAll(senderMessages);
    });

    await receiverSubscription.asFuture();
    await senderSubscription.asFuture();

    completer.complete(messages);
  } catch (error) {
    print('Failed to fetch messages');
    print(error.toString());
    completer.completeError(error);
  }

  return completer.future;
}*/
