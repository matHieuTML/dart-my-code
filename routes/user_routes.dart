import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import '../controllers/user_controller.dart';

class UserRoutes {
  final UserController _userController = UserController();

  Future<Response> handlePostRequest(Request request) async {
    final user = await request.readAsString();
    await _userController.saveUser(user);
    return Response.ok('Contenu envoyer vers la bdd avec succès.');
  }

  Future<Response> handleGetRequest(Request request) async {
    final idParam = request.url.pathSegments.last;
    final id = ObjectId.parse(idParam);
    final user = await _userController.getUser(id);
    
    if (user != null) {
      return Response.ok(user);
    } else {
      return Response.notFound('Le contenu n\'as pas été trouver.');
    }
  }
}
