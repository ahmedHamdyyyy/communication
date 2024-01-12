import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:communication/service/components.dart';
import '../../Auth/models/UserModel.dart';
import '../models/MessageModel.dart';
import '../models/comments.dart';
import '../models/postModels.dart';

class HomeState extends Equatable {
  final String message;
  final int currentIndex;
  final String currentLang;
  final int currentTheme;
  final String imagePath;
  final bool isLiked;

  final File? imageFile;
  final List<PostModel> posts;
  final List<String> postId;
  final List<PostModel> postsUser;
  final List<UserModelSocial> users;
  final List<CommentModel> comments;
  final List<MessageModel> messages;


  final MyStatus langState;
  final MyStatus likeRemoveState;
  final MyStatus getAllUsersState;
  final MyStatus deletePostState;
  final MyStatus getMessagesUserState;
  final MyStatus createMessageState;
  final MyStatus getPostsUserState;
  final MyStatus getCommentsUserState;
  final MyStatus createCommentState;
  final MyStatus createPostState;
  final MyStatus likePostState;
  final MyStatus uploadPostState;
  final MyStatus getMyData;
  final MyStatus getUserInfo;

  final MyStatus getAllPostsState;
  final MyStatus logOutState;
  final MyStatus postImageState;
  final UserModelSocial myDataModelSocial;
  final UserModelSocial userModelSocial;
  final PostModel postModel;


  const HomeState({
    this.message = "",
    this.imagePath = "",
    this.currentLang = "en",
    this.currentIndex = 0,
    this.currentTheme = 0,
    this.isLiked = false,

    this.posts = const [],
    this.postId = const [],
    this.users = const [],
    this.comments = const [],
    this.messages = const [],
    this.postsUser = const [],
    this.imageFile,
    this.langState = MyStatus.initial,
    this.likeRemoveState = MyStatus.initial,
    this.deletePostState = MyStatus.initial,
    this.postImageState = MyStatus.initial,
    this.createCommentState = MyStatus.initial,
    this.likePostState = MyStatus.initial,
    this.getCommentsUserState = MyStatus.initial,
    this.getMessagesUserState = MyStatus.initial,
    this.getAllUsersState = MyStatus.initial,
    this.createPostState = MyStatus.initial,
    this.getPostsUserState = MyStatus.initial,
    this.uploadPostState = MyStatus.initial,
    this.createMessageState = MyStatus.initial,
    this.getAllPostsState = MyStatus.initial,
    this.myDataModelSocial = UserModelSocial.non,
    this.postModel = PostModel.non,
    this.userModelSocial = UserModelSocial.non,
    this.getMyData = MyStatus.initial,
    this.getUserInfo = MyStatus.initial,
    this.logOutState = MyStatus.initial,
  });

  HomeState copyWith({
    String? message,
    String? imagePath,
    String? currentLang,
    bool? isLiked,

    List<PostModel>? posts,
    List<PostModel>? postsUser,
    List<CommentModel>? comments,
    List<int>? likes,
    List<String>? postId,
    List<MessageModel>? messages,
    List<UserModelSocial>? users,
    MyStatus? langState,
    MyStatus? deletePostState,
    MyStatus? getAllUsersState,
    MyStatus? getPostsUserState,
    MyStatus? likeRemoveState,
    MyStatus? getCommentsUserState,
    MyStatus? getMessagesUserState,
    MyStatus? getUserInfo,
    MyStatus? likePostState,
    MyStatus? createMessageState,
    UserModelSocial? myDataModelSocial,
    UserModelSocial? userModelSocial,
    PostModel? postModel,
    int? currentIndex,
    int? currentTheme,
    List<String>? item,
    MyStatus? getMyData,
    MyStatus? logOutState,
    MyStatus? getAllPostsState,
    MyStatus? createPostState,
    MyStatus? createCommentState,
    MyStatus? uploadPostState,
    MyStatus? postImageState,
    File? imageFile,
  }) {
    return HomeState(

      currentIndex: currentIndex ?? this.currentIndex,
      likeRemoveState: likeRemoveState ?? this.likeRemoveState,
      deletePostState: deletePostState ?? this.deletePostState,
      isLiked: isLiked ?? this.isLiked,
      currentLang: currentLang ?? this.currentLang,
      comments: comments ?? this.comments,
      postId: postId ?? this.postId,
      currentTheme: currentTheme ?? this.currentTheme,
      messages: messages ?? this.messages,
      likePostState: likePostState ?? this.likePostState,
      getCommentsUserState: getCommentsUserState ?? this.getCommentsUserState,
      createMessageState: createMessageState ?? this.createMessageState,
      getAllUsersState: getAllUsersState ?? this.getAllUsersState,
      langState: langState ?? this.langState,
      users: users ?? this.users,
      getPostsUserState: getPostsUserState ?? this.getPostsUserState,
      getMessagesUserState: getMessagesUserState ?? this.getMessagesUserState,
      postsUser: postsUser ?? this.postsUser,
      getUserInfo: getUserInfo ?? this.getUserInfo,
      imagePath: imagePath ?? this.imagePath,
      createCommentState: createCommentState ?? this.createCommentState,
      message: message ?? this.message,
      createPostState: createPostState ?? this.createPostState,
      uploadPostState: uploadPostState ?? this.uploadPostState,
      myDataModelSocial: myDataModelSocial ?? this.myDataModelSocial,
      postModel: postModel ?? this.postModel,
      userModelSocial: userModelSocial ?? this.userModelSocial,
      getMyData: getMyData ?? this.getMyData,
      logOutState: logOutState ?? this.logOutState,
      postImageState: postImageState ?? this.postImageState,
      getAllPostsState: getAllPostsState ?? this.getAllPostsState,
      imageFile: imageFile ?? this.imageFile,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object?> get props => [
        messages,
        langState,
    deletePostState,
    isLiked,

        postModel,
        currentTheme,
    likeRemoveState,
        postId,
        currentLang,
        getMessagesUserState,
        likePostState,
        getPostsUserState,
        userModelSocial,
        getUserInfo,
        imageFile,
        createMessageState,
        createCommentState,
        postsUser,
        imagePath,
        users,
        getAllUsersState,
        createPostState,
        uploadPostState,
        postImageState,
        message,
        getCommentsUserState,
        comments,
        currentIndex,
        myDataModelSocial,
        getMyData,
        logOutState,
        posts,
        getAllPostsState,
      ];
}
