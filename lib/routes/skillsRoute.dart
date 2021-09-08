import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skill_tree/general.dart';
import 'package:skill_tree/repositories/filePersistence.dart';
import 'package:skill_tree/routes/skillTreeRoute.dart';
import '../models.dart';
import 'addSkillRoute.dart';

class SkillsRoute extends StatefulWidget {
  const SkillsRoute({Key? key, required this.storage}) : super(key: key);
  final FilePersistence storage;

  @override
  _SkillsRouteState createState() => _SkillsRouteState();
}

class _SkillsRouteState extends State<SkillsRoute> {
  List<Skill> skills = [];
  final clearDocuments = false;

  @override
  void initState() {
    super.initState();
    if (clearDocuments) _clearAppDocs();

    var skillsJson = widget.storage.getJsonFile('skills.json');
    skillsJson.then((json) {
      setState(() {
        for (var map in json) {
          var skill = Skill.fromJson(map);
          skills.add(skill);
        }
      });
    });
  }

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
        body: _displaySkills(skills),
        drawer: createDrawer(context));
  }

  Widget _displaySkills(List<Skill> skills) {
    return GridView.builder(
      primary: false,
      padding: const EdgeInsets.all(15),
      itemCount: skills.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, i) {
        return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Expanded(child: _createCardInkwell(skills[i])));
      },
    );
  }

  Widget _createCardInkwell(Skill skill) {
    return InkWell(
        splashColor: foregroundColor,
        onTap: () => _skillTreeRoute(skill: skill),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [Icon(Icons.air, size: 50)],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Spacer(),
              Row(
                children: [Text(skill.name, style: TextStyle(fontSize: 24))],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              LinearProgressIndicator(
                value: 0.5,
                color: progressColor,
                backgroundColor: foregroundColor,
              )
            ],
          ),
        ));
  }

  void _addSkill() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddSkillRoute(storage: widget.storage)));
  }

  Future<void> _clearAppDocs() async {
    final appDir = await getApplicationDocumentsDirectory();
    appDir.deleteSync(recursive: true);
  }

  void _skillTreeRoute({Skill? skill}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (buildContext) => SkillTreeRoute()));
  }
}
