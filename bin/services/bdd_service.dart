import 'package:mongo_dart/mongo_dart.dart';
import 'package:dotenv/dotenv.dart';

class DatabaseService {
  late Db _db;

  Future? connect() async {
    var env = DotEnv(includePlatformEnvironment: true)..load();
    final mongodbUri = env['MONGODB_URI'];

    _db = await Db.create(mongodbUri!);

    try {
      await _db.open();
      if (_db.isConnected) {
        print('Connexion à la base de données MongoDB réussie !');
      } else {
        print('Échec de la connexion à la base de données MongoDB.');
      }
    } catch (e) {
      print('Erreur lors de la connexion à la base de données MongoDB : $e');
    }
  }

  Db get db => _db;

  Future? close() async {
    await _db.close(); 
  }
}
