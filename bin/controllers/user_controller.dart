import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
import '../services/bdd_service.dart';

class UserController {
  final DatabaseService _databaseService = DatabaseService();

  Future<void> saveUser(String? email, String? username, String? password) async {
    if (email != null && username != null && password != null) {
      // mdp hash
      var bytes = utf8.encode(password); 
      var digest = sha256.convert(bytes);

      await _databaseService.connect();
      final usersCollection = _databaseService.db.collection('users');
      await usersCollection.insert({
        'email': Uri.decodeComponent(email),
        'username': username,
        'password': digest.toString(),
        'createdAt': DateTime.now(),
      });
      await _databaseService.close();
    }
  }

  Future<String?> getUser(ObjectId id) async {
    await _databaseService.connect();
    final usersCollection = _databaseService.db.collection('users');
    final user = await usersCollection.findOne(where.id(id));
    await _databaseService.close();
    return user != null ? user['username'] : null;
  }
}
