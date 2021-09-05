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
    response.add(object);
    final newJsonData = jsonEncode(response);

    final jsonFile = await _localFile(fileName);
    jsonFile.writeAsString(newJsonData);
  }
}
