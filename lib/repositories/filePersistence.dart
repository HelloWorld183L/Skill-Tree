import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class FilePersistence {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<String> getFilename(String userId, String type, String key) async {
    return userId + '/' + type + '/' + key;
  }

  Future<List> getJsonFile(String fileName) async {
    final file = await _localFile(fileName);

    if (await file.exists()) {
      final fileContents = await file.readAsString();
      final data = await jsonDecode(fileContents);
      return data;
    }
    return [];
  }

  void saveObject(Map<String, dynamic> object, String fileName) async {
    final response = await getJsonFile(fileName);
    Map<String, dynamic>? originalObject;
    for (var map in response) {
      if (map['id'] == object['id']) {
        originalObject = map;
        break;
      }
    }

    if (originalObject == null) {
      response.add(object);
    } else {
      response.remove(originalObject);
      response.insert(object['id'] - 1, object);
    }

    final newJsonData = jsonEncode(response);
    final jsonFile = await _localFile(fileName);
    jsonFile.writeAsString(newJsonData);
  }

  void editObject(Map<String, dynamic> newObject, String fileName) async {
    final response = await getJsonFile(fileName);
    Map<String, dynamic>? originalObject;
    for (var map in response) {
      if (map['id'] == newObject['id']) {
        originalObject = map;
        break;
      }
    }

    response.remove(originalObject);
    response.insert(newObject['id'] - 1, newObject);

    final newJsonData = jsonEncode(response);
    final jsonFile = await _localFile(fileName);
    jsonFile.writeAsString(newJsonData);
  }

  Future<int> getJsonObjectLength(String fileName) async {
    final response = await getJsonFile(fileName);
    return response.length;
  }

  Future<void> deleteObject(
      Map<String, dynamic> object, String fileName) async {
    final response = await getJsonFile(fileName);
    final objectToDelete =
        response.firstWhere((element) => element['name'] == object['name']);
    response.remove(objectToDelete);

    final encodedResponse = jsonEncode(response);
    final jsonFile = await _localFile(fileName);
    jsonFile.writeAsString(encodedResponse);
  }
}
