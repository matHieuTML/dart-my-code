import 'package:mongo_dart/mongo_dart.dart';

class User {
  late ObjectId id; // L'identifiant unique généré par MongoDB
  late String username; 
  late String email;
  late String password;
  late DateTime createdAt;

  User(this.username, this.email, this.password, this.createdAt);

  // Convertir un objet User en Map pour pouvoir le stocker dans MongoDB
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'createdAt': createdAt,
    };
  }

  // Constructeur à partir d'un Map récupéré depuis MongoDB
  User.fromMap(Map<String, dynamic> map) {
    id = map['_id'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
    createdAt = map['createdAt'];
  }
}