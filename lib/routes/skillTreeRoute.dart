import 'package:flutter/material.dart';
import '../general.dart';

class SkillTreeRoute extends StatefulWidget {
  @override
  _SkillTreeRouteState createState() => _SkillTreeRouteState();
}

class _SkillTreeRouteState extends State<SkillTreeRoute> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skill tree'),
        ),
        body: _displayInputs(context),
        drawer: createDrawer(context));
  }

  Widget _displayInputs(context) {
    return Container();
  }

  void _addSkill() {}
}
