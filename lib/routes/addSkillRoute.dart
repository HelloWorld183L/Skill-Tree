import 'package:flutter/material.dart';
import 'package:skill_tree/routes/skillTreeRoute.dart';
import '../general.dart';
import 'package:skill_tree/models.dart';

class AddSkillRoute extends StatefulWidget {
  @override
  _AddSkillRouteState createState() => _AddSkillRouteState();
}

class _AddSkillRouteState extends State<AddSkillRoute> {
  final _formKey = GlobalKey<FormState>();
  final _skill = Skill();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add a new skill'),
        ),
        body: _displayInputs(context),
        drawer: createDrawer(context));
  }

  Widget _displayInputs(context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createTextField('Skill name', '', (val) {
                  setState(() {
                    _skill.name = val;
                  });
                }),
                createTextField('Skill cap', '', (val) {
                  setState(() {
                    _skill.skillCap = val;
                  });
                }),
                Row(children: [
                  createBtn('Save', _addSkill),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(166, 0, 0, 0),
                      child: createBtn(
                          'Save skill tree',
                          () => () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SkillTreeRoute()));
                              })),
                ]),
              ],
            )));
  }

  void _addSkill() {}
}
