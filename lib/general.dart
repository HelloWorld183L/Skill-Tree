import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skill_tree/routes/activitiesRoute.dart';
import 'package:skill_tree/routes/statisticsRoute.dart';
import 'package:skill_tree/routes/settingsRoute.dart';
import 'package:skill_tree/routes/skillsRoute.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

const backgroundColor = Color.fromRGBO(22, 25, 37, 1);
const textColor = Color.fromRGBO(253, 255, 252, 1);
const greenColor = Color.fromRGBO(96, 184, 61, 1);
const progressColor = Color.fromRGBO(230, 115, 15, 1);
const foregroundColor = Color.fromRGBO(48, 51, 61, 1);

const textStyle = const TextStyle(color: textColor);

Widget createDrawer(buildContext) {
  return Drawer(
      child: ListView(children: <Widget>[
    const DrawerHeader(
        padding: EdgeInsets.all(60.0),
        decoration: BoxDecoration(color: backgroundColor),
        child: Text(
          'Skill tree',
          textAlign: TextAlign.center,
          style: const TextStyle(color: textColor, fontSize: 32),
        )),
    ListTile(
      leading: Icon(Icons.computer),
      title: Text('Activities'),
      onTap: () {
        Navigator.push(buildContext,
            MaterialPageRoute(builder: (buildContext) => ActivitiesRoute()));
      },
    ),
    ListTile(
      leading: Icon(Icons.piano),
      title: Text('Skills'),
      onTap: () {
        Navigator.push(buildContext,
            MaterialPageRoute(builder: (buildContext) => SkillsRoute()));
      },
    ),
    ListTile(
      leading: Icon(Icons.auto_graph),
      title: Text('Statistics'),
      onTap: () {
        Navigator.push(buildContext,
            MaterialPageRoute(builder: (buildContext) => StatisticsRoute()));
      },
    ),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text('Settings'),
      onTap: () {
        Navigator.push(buildContext,
            MaterialPageRoute(builder: (buildContext) => SettingsRoute()));
      },
    ),
  ]));
}

TextFormField createTextField(String placeholderValue, onSaved) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please enter some text";
      }
      return null;
    },
    decoration: InputDecoration(hintText: placeholderValue),
    onSaved: onSaved,
  );
}

ElevatedButton createBtn(String text, onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(text),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(foregroundColor),
    ),
  );
}

Future<List> readJson(String jsonPath) async {
  final response = await rootBundle.loadString(jsonPath);
  final data = await jsonDecode(response);

  return data;
}

Future<void> saveJson(String fileName, List newJsonData) async {
  final dirPath = await _getDirPath();
  final jsonFile = File('$dirPath/$fileName');
  jsonFile.writeAsString(json.encode(newJsonData));
}

Future<String> _getDirPath() async {
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}