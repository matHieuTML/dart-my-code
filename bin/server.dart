import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:dotenv/dotenv.dart';
import 'package:shelf_router/shelf_router.dart';
import '../routes/content_routes.dart';
import '../services/bdd_service.dart';

void main(List<String> args) async {
  // Charge les variables d'environnement depuis le fichier .env
  var env = DotEnv()..load();

  // Initialise le service de base de données
  final databaseService = DatabaseService();
  await databaseService.connect();

  // Crée une instance de ContentRoutes
  final contentRoutes = ContentRoutes();

  // Les routes
  final handler = Pipeline().addMiddleware(logRequests()).addHandler((request) {
    final router = Router();

    router.post('/content', (request) async {
      return contentRoutes.handlePostRequest(request);
    });
    
    router.get('/content/<id>', (request) async {
      return contentRoutes.handleGetRequest(request);
    });

    return router(request);
  });

  // Port sur lequel le serveur va écouter
  final port = int.parse(env['PORT'] ?? '8080');

  // Démarre le serveur sur toutes les interfaces IP disponibles
  final server = await io.serve(handler, InternetAddress.anyIPv4, port);
  print('Server listening on port ${server.port}');
}
