import 'package:flutter/material.dart';

const backgroundColor = Color.fromRGBO(22, 25, 37, 1);
const textColor = Color.fromRGBO(253, 255, 252, 1);
const greenColor = Color.fromRGBO(96, 184, 61, 1);
const progressColor = Color.fromRGBO(230, 115, 15, 1);
const foregroundColor = Color.fromRGBO(48, 51, 61, 1);

const textStyle = const TextStyle(color: textColor);

Widget createDrawer() {
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
      onTap: _navigate,
    ),
    ListTile(
      leading: Icon(Icons.piano),
      title: Text('Skills'),
      onTap: _navigate,
    ),
    ListTile(
      leading: Icon(Icons.auto_graph),
      title: Text('Statistics'),
      onTap: _navigate,
    ),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text('Settings'),
      onTap: _navigate,
    ),
  ]));
}

void _navigate() {}
