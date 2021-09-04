import 'package:flutter/material.dart';
import 'package:skill_tree/models.dart';
import '../general.dart';

class AddActivityRoute extends StatefulWidget {
  @override
  _AddActivityRouteState createState() => _AddActivityRouteState();
}

class _AddActivityRouteState extends State<AddActivityRoute> {
  final _formKey = GlobalKey<FormState>();
  final difficultyValue = 'Easy';
  final difficulties = ['Easy', 'Medium', 'Hard', 'Brainfuck'];

  final skillValue = 'No skill';
  final skills = ['No skill'];

  final _activityToSubmit = Activity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new activity'),
      ),
      body: _displayForm(),
      drawer: createDrawer(context),
    );
  }

  Widget _displayForm() {
    return Padding(
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createTextField('Activity name', (val) {
                  setState(() {
                    _activityToSubmit.name = val;
                  });
                }),
                createTextField('XP reward', (val) {
                  setState(() {
                    _activityToSubmit.xpGain = val;
                  });
                }),
                createDropdownBtn(difficultyValue, difficulties),
                createDropdownBtn(skillValue, skills),
                Padding(
                    padding: const EdgeInsets.fromLTRB(280.0, 20.0, 0, 0),
                    // Grab the field values, serialize the activity
                    child: createBtn('Save', _addActivity)),
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

  void _addActivity() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Activity has been saved.')),
      );
    }
  }
}
