import 'package:flutter/material.dart';
import 'package:skill_tree/models.dart';
import '../general.dart';
import 'package:skill_tree/repositories/filePersistence.dart';

class ActivityDetailsRoute extends StatefulWidget {
  const ActivityDetailsRoute(
      {Key? key, required this.storage, this.existingActivity})
      : super(key: key);

  final FilePersistence storage;
  final Activity? existingActivity;

  @override
  _ActivityDetailsRouteState createState() => _ActivityDetailsRouteState();
}

class _ActivityDetailsRouteState extends State<ActivityDetailsRoute> {
  final _formKey = GlobalKey<FormState>();
  var difficultyValue = 'Easy';
  final difficulties = ['Easy', 'Medium', 'Hard', 'Brainfuck'];

  var skillValue = 'No skill';
  final skills = ['No skill'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity details'),
      ),
      body: _displayForm(),
      drawer: createDrawer(context),
    );
  }

  Widget _displayForm() {
    var _activityToSubmit = widget.existingActivity ?? Activity();

    return Padding(
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createTextField('Activity name', _activityToSubmit.name, (val) {
                  setState(() {
                    if (_activityToSubmit.name.isEmpty) {
                      _activityToSubmit.name = _activityToSubmit.name;
                    }
                    _activityToSubmit.name = val;
                  });
                }),
                createTextField('XP reward', _activityToSubmit.xpGain, (val) {
                  setState(() {
                    if (_activityToSubmit.xpGain.isEmpty) {
                      _activityToSubmit.xpGain = _activityToSubmit.xpGain;
                    }
                    _activityToSubmit.xpGain = val;
                  });
                }),
                createDropdownBtn(difficultyValue, difficulties),
                createDropdownBtn(skillValue, skills),
                Padding(
                    padding: const EdgeInsets.fromLTRB(280.0, 20.0, 0, 0),
                    // Grab the field values, serialize the activity
                    child: createBtn(
                        'Save', () => _saveActivity(_activityToSubmit))),
              ],
            )));
  }

  DropdownButtonFormField createDropdownBtn(
      String currentValue, List<String> dropdownItems) {
    return DropdownButtonFormField(
      value: currentValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 16,
      onChanged: (newValue) {
        setState(() {
          currentValue = newValue!;
        });
      },
      items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void _saveActivity(Activity activity) {
    activity.difficulty = difficultyValue;
    activity.skill = skillValue;
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Activity has been saved.')),
      );

      widget.storage.saveObject(activity.toJson(), 'activities.json');
    }
  }
}
