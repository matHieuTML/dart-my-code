import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import '../controllers/content_controller.dart';

class ContentRoutes {
  final ContentController _contentController = ContentController();

  Future<Response> handlePostRequest(Request request) async {
    final content = await request.readAsString();
    await _contentController.saveContent(content);
    return Response.ok('Contenu envoyer vers la bdd avec succès.');
  }

  Future<Response> handleGetRequest(Request request) async {
    final idParam = request.url.pathSegments.last;
    final id = ObjectId.parse(idParam);
    final content = await _contentController.getContent(id);
    
    if (content != null) {
      return Response.ok(content);
    } else {
      return Response.notFound('Le contenu n\'as pas été trouver.');
    }
  }
}
