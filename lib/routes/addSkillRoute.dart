import 'package:flutter/material.dart';
import 'package:skill_tree/repositories/filePersistence.dart';
import 'package:skill_tree/routes/skillTreeRoute.dart';
import '../general.dart';
import 'package:skill_tree/models.dart';

class AddSkillRoute extends StatefulWidget {
  const AddSkillRoute({Key? key, required this.storage}) : super(key: key);

  final FilePersistence storage;

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
                    _skill.skillCap = int.parse(val);
                  });
                }),
                Row(children: [
                  createBtn('Save', () => _addSkill(_skill)),
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

  void _addSkill(Skill skill) {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Skill has been saved.')),
      );

      widget.storage.saveObject(skill.toJson(), 'skills.json');
    }
  }
}
