import 'package:mongo_dart/mongo_dart.dart';

class Contents {
  late ObjectId id;
  late ObjectId userId;
  late String content;
  late DateTime expiration;
  late DateTime createdAt;
  late DateTime updatedAt;
  late bool sharable;

  Contents(this.userId, this.content, this.expiration, this.createdAt, this.updatedAt, this.sharable);

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'content': content,
      'expiration': expiration,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'sharable': sharable,
    };
  }

  Contents.fromMap(Map<String, dynamic> map) {
    id = map['_id'];
    userId = map['userId'];
    content = map['content'];
    expiration = map['expiration'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
    sharable = map['sharable'];
  }
}
