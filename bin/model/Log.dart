import 'package:mongo_dart/mongo_dart.dart';

class Logs {
  late ObjectId id; 
  late ObjectId contentId; 
  late ObjectId userId; 
  late DateTime createdAt;

  Logs(this.contentId, this.userId, this.createdAt);

  Map<String, dynamic> toMap() {
    return {
      'contentId': contentId,
      'userId': userId,
      'createdAt': createdAt,
    };
  }

  Logs.fromMap(Map<String, dynamic> map) {
    id = map['_id'];
    contentId = map['contentId'];
    userId = map['userId'];
    createdAt = map['createdAt'];
  }
}
