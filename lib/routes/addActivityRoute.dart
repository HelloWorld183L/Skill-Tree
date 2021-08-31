import 'package:flutter/material.dart';
import 'general.dart';

class AddActivityRoute extends StatefulWidget {
  @override
  _AddActivityRouteState createState() => _AddActivityRouteState();
}

class _AddActivityRouteState extends State<AddActivityRoute> {
  final _formKey = GlobalKey<FormState>();
  final difficultyValue = 'Easy';
  final difficulties = ['Easy', 'Medium', 'Hard', 'Brainfuck'];

  final xpRewardValue = '50';

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
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createTextField('Activity name'),
            createTextField('XP reward'),
            createDropdownBtn(difficultyValue, difficulties),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              minLines: 4,
              maxLines: null,
              decoration: InputDecoration(hintText: 'Description'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Activity has been saved.')),
                    );
                  }
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ));
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

  TextFormField createTextField(String placeholderValue) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter some text";
        }
        return null;
      },
      decoration: InputDecoration(hintText: placeholderValue),
    );
  }
}
