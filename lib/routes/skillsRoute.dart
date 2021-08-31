import 'package:flutter/material.dart';
import 'package:skill_tree/routes/general.dart';

class SkillsRoute extends StatefulWidget {
  @override
  _SkillsRouteState createState() => _SkillsRouteState();
}

class _SkillsRouteState extends State<SkillsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skills'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: foregroundColor,
          onPressed: _addSkill,
        ),
        body: _displaySkills(),
        drawer: createDrawer(context));
  }

  Widget _displaySkills() {
    return Container();
  }

  void _addSkill() {}
}
