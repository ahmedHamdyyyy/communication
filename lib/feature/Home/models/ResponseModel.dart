import 'package:equatable/equatable.dart';

import '../../../service/components.dart';

class ResponseModel extends Equatable {
  final MyStatus? state;
  final String? msg;
  //final int? statusCode;
  //final ErrorType? error;
  final dynamic data;

  const ResponseModel({
    this.state,
    this.msg,
    //this.error,
    // this.statusCode,
    this.data,
  });
  // factory ResponseModel.post(Map<String, dynamic> json) => ResponseModel(
  //       success: json['success'],
  //       msg: json['msg'],
  //       data: PostModel.fromPModel(PModel.fromMap(json['data'])),
  //     );

  // factory ResponseModel.posts(Map<String, dynamic> json) {
  //   success = json['success'];
  //   msg = json['msg'];
  //   data = (json['data'] as List)
  //       .map((e) => PostModel.fromPModel(PModel.fromMap(e)))
  //       .toList();
  // }

  // ResponseModel.friends(Map<String, dynamic> json) {
  //   success = json['success'];
  //   msg = json['msg'];
  //   data = (json['data'] as List).map((e) => Friend.fromMap(e)).toList();
  // }

  // ResponseModel.comments(Map<String, dynamic> json) {
  //   success = json['success'];
  //   msg = json['msg'];
  //   data = MyComment.fromGetComment(json['data']);
  // }

  @override
  List<Object?> get props => [
        state,
        msg,
        data,
      ];
}
