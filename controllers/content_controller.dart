import 'package:mongo_dart/mongo_dart.dart';
import '../services/bdd_service.dart';

class ContentController {
  final DatabaseService _databaseService = DatabaseService();

  Future<void> saveContent(String content) async {
    await _databaseService.connect();
    final contentsCollection = _databaseService.db.collection('contents');
    await contentsCollection.insert({'content': content, 'createdAt': DateTime.now()});
    await _databaseService.close();
  }

  Future<String?> getContent(ObjectId id) async {
    await _databaseService.connect();
    final contentsCollection = _databaseService.db.collection('contents');
    final content = await contentsCollection.findOne(where.id(id));
    await _databaseService.close();
    return content != null ? content['content'] : null;
  }
}
