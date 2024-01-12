import 'package:equatable/equatable.dart';
class CommentModel extends Equatable {
  final String postId;
  final String image;
  final String desc;
  final String name;
  final String dateTime;
  const CommentModel({
    required this.postId,
    required this.image,
    required this.desc,
    required this.name,
    required this.dateTime,
  });
  static const non=CommentModel(postId: "", image: "", desc: "", name: "", dateTime: "");

  Map<String, dynamic> toMap() => {

        'postId': postId,
        'desc': desc,
        'image': image,
        'name': name,
        'dateTime': dateTime,
      };

  factory CommentModel.fromMap(Map<String, dynamic> map) => CommentModel(

        image: map['image'],
        postId: map['postId'] as String,
        name: map['name'] as String,
        desc: map['desc'] as String,
    dateTime: map['dateTime'] as String,
      );

  @override
  List<Object> get props => [

        postId,
        image,
        desc,
        name,
    dateTime,

        // image,
      ];
}
