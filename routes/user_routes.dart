import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import '../controllers/user_controller.dart';

class UserRoutes {
  final UserController _userController = UserController();

  Future<Response> handlePostRequest(Request request) async {
    final form = await request.readAsString();
    final List<String> userData = form.split('&');
    final Map<String, String?> userMap = {};

    for (final data in userData) {
      final List<String> keyValue = data.split('=');
      userMap[keyValue[0]] = keyValue.length > 1 ? keyValue[1] : null;
    }

    final email = userMap['email'];
    final username = userMap['username'];
    final password = userMap['password'];

    if (email != null && username != null && password != null) {
      await _userController.saveUser(email, username, password);
      return Response.ok('Utilisateur enregistré avec succès.');
    } else {
      return Response.notFound('L\'utilisateur n\'as pas pu être ajouter.');
    }
  }

  Future<Response> handleGetRequest(Request request) async {
    final idParam = request.url.pathSegments.last;
    final id = ObjectId.parse(idParam);
    final user = await _userController.getUser(id);
    
    if (user != null) {
      return Response.ok(user);
    } else {
      return Response.notFound('Utilisateur non trouvé.');
    }
  }
}
