class MessageModel {
  String? receiverId;
  String? senderId;
  String? timestamp;
  String ?text;

  MessageModel({
    required this.receiverId,
    required this.senderId,
    required this.timestamp,
    required this.text,
  });

  MessageModel.fromJson(json) {
    receiverId = json['receiverId'];
    senderId = json['senderId'];
    timestamp = json['timestamp'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return {
      'receiverId': receiverId,
      'senderId': senderId,
      'timestamp': timestamp,
      'text': text,
    };
  }
}