import 'package:equatable/equatable.dart';
class PostModel extends Equatable {
  final String name;
  final String uId;
  final String dateTime;
  final String text;
  final String postImage;
  final String image;
  final String postId;
  final List<String> likes;
  //int get likeCount => likes.length;

  static const non = PostModel(
      uId: "",
      name: "",
      dateTime: "",
      postId: "",
      postImage: "",
      text: "",
      image: "",
      likes: [],

      /*comments: []*/);
  const PostModel({
    required this.name,
    required this.uId,
    required this.dateTime,
    required this.text,
    required this.postImage,
    required this.postId,
    required this.image,
     required this.likes,
   // required this.comments,
  });



  PostModel copyWith({
    String? name,
    String? uId,
    String? dateTime,
    String? text,
    String? postImage,
    String? image,
    String? postId,
    List<String>? likes,
   // List<CommentModel>? comments,
  }) {
    return PostModel(
      name: name ?? this.name,
      uId: uId ?? this.uId,
      dateTime: dateTime ?? this.dateTime,
      likes: likes ?? this.likes,
      text: text ?? this.text,
      postImage: postImage ?? this.postImage,
      image: image ?? this.image,
      postId: postId ?? this.postId,
      //comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'dateTime': dateTime,
      'text': text,
      'postImage': postImage,
      'image': image,
      'postId': postId,
      'likes': likes,
      //'comments': comments.map((comment) => comment.toMap()).toList(),
    };
  }

  static PostModel fromMap(Map<String, dynamic> map) {
    return PostModel(
      name: map['name'],
      uId:map['uId'],
      likes: List.from((map['likes'] as List)).cast<String>(),
      dateTime: map['dateTime'],
      text: map['text'],
      postImage: map['postImage'],
      image: map['image'],
      postId: map['postId'],
 /*     comments: List<CommentModel>.from(
        map['comments'].map((comment) => CommentModel.fromMap(comment)),
      ),*/
    );
  }
  @override
  List<Object?> get props => [
    name,
    uId,
    dateTime,
    text,
    likes,
    postImage,
    postId,
  ];
}
