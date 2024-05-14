A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

This sample code handles HTTP GET requests to `/` and `/echo/<message>`

# Running the sample

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart run bin/server.dart
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

# Ligne de commande

## Récupérer tous les snippets
```
curl -X GET http://localhost:8080/snippets
```
## Récupérer un snippet par ID
```
curl -X GET http://localhost:8080/snippets/<id>
```
## Créer un nouveau snippet
```
curl -X POST http://localhost:8080/snippets -H "Content-Type: application/json" -d '{"code": "print(\"Hello, World!\");", "description": "A simple hello world program in Dart"}'
```
## Mettre à jour un snippet
```
curl -X PUT http://localhost:8080/snippets/<id> -H "Content-Type: application/json" -d '{"code": "print(\"Hello, Dart!\");", "description": "An updated hello world program in Dart"}'
```
## Supprimer un snippet
```
curl -X DELETE http://localhost:8080/snippets/<id>
```