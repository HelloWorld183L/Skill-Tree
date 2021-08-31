import 'package:flutter/material.dart';
import 'package:skill_tree/routes/general.dart';

class SettingsRoute extends StatefulWidget {
  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: _displaySettings(),
        drawer: createDrawer(context));
  }

  Widget _displaySettings() {
    return Container();
  }
}
