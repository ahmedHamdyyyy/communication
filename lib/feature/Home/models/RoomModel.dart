/*import 'package:equatable/equatable.dart';

import 'messges.dart';

class RoomModel extends Equatable {
  final List<String> users;
  final List<Message> messages;
  final String id;

  const RoomModel({
    required this.id,
    required this.users,
    required this.messages,
  });


  RoomModel copyWith({
    List<String>? users,
    List<Message>? messages,
    String? id,
  }) {
    return RoomModel(
      users: users ?? this.users,
      messages: messages ?? this.messages,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users,
      'messages': messages,
      'id': id,
    };
  }


  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      users: map['users'] as List<String>,
      messages: map['messages'] as List<Message>,
      id: map['id'] as String,
    );
  }

  @override
  List<Object> get props => [users, messages, id];
}*/
