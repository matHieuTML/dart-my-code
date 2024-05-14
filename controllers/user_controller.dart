import 'package:mongo_dart/mongo_dart.dart';
import '../services/bdd_service.dart';

class UserController {
  final DatabaseService _databaseService = DatabaseService();

  Future<void> saveUser(String user) async {
    await _databaseService.connect();
    final usersCollection = _databaseService.db.collection('users');
    await usersCollection.insert({'user': user, 'createdAt': DateTime.now()});
    await _databaseService.close();
  }

  Future<String?> getUser(ObjectId id) async {
    await _databaseService.connect();
    final usersCollection = _databaseService.db.collection('users');
    final user = await usersCollection.findOne(where.id(id));
    await _databaseService.close();
    return user != null ? user['user'] : null;
  }
}
