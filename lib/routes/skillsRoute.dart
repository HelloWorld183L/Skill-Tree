import 'package:flutter/material.dart';
import 'package:skill_tree/routes/general.dart';
import 'addSkillTreeRoute.dart';

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
    return GridView.builder(
      primary: false,
      padding: const EdgeInsets.all(15),
      itemCount: 3,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, i) {
        return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Expanded(child: _createCardInkwell()));
      },
    );
  }

  Widget _createCardInkwell() {
    return InkWell(
        splashColor: foregroundColor,
        onTap: () {},
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
                children: [Text('PROGRAMMER (9001)')],
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
    Navigator.push(context,
        MaterialPageRoute(builder: (buildContext) => AddSkillTreeRoute()));
  }
}
