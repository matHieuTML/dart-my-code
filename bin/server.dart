import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  // Connect to a MongoDB database.
  final db = await Db.create(
      'mongodb+srv://Abder951:Abder2002@cluster0.jngetun.mongodb.net/shareMyCode/');
  try {
    await db.open();
    if (db.isConnected) {
      print('Connexion à la base de données MongoDB réussie !');
    } else {
      print('Échec de la connexion à la base de données MongoDB.');
    }
  } catch (e) {
    print('Erreur lors de la connexion à la base de données MongoDB : $e');
  } finally {
    await db.close(); // Fermez toujours la connexion après utilisation
  }

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '7456');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
