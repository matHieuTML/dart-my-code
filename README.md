A server app built using [Shelf](https://pub.dev/packages/shelf),

# Running the sample

## Running with the Dart SDK
First install all dependencies

```
dart pub get
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