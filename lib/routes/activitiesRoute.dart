import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skill_tree/routes/addActivityRoute.dart';
import 'package:skill_tree/general.dart';
import 'package:skill_tree/models.dart';

class ActivitiesRoute extends StatefulWidget {
  @override
  _ActivitiesRouteState createState() => _ActivitiesRouteState();
}

class _ActivitiesRouteState extends State<ActivitiesRoute> {
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();
    var activitiesJson = readJson('assets/activities.json');
    activitiesJson.then((json) {
      setState(() {
        activities = json.map((i) => Activity.fromJson(i)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Deserialize the list of activities the user already has
    // itemCount = list.length
    // Pass in the activities list to then be indexed through to _displayActivities()
    // NOTE: Activities should be deserialized each time the Widget is viewed...
    // but this is not scalable for performance, keep it simple tho

    return Scaffold(
        appBar: AppBar(
          title: const Text('Activities'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: foregroundColor,
          onPressed: _addActivity,
        ),
        body: _displayActivities(activities),
        drawer: createDrawer(context));
  }

  Widget _displayActivities(List<Activity> activities) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, i) =>
                        activitiesContainer(activities[i])))
          ]),
    );
  }

  Widget activitiesContainer(Activity activity) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 94,
        width: double.maxFinite,
        child: Card(
            elevation: 5,
            color: backgroundColor,
            child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        activityName(activity.name),
                        Spacer(),
                        activityXPIncrease(activity.xpGain),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    addXPTxt()
                  ],
                ))));
  }

  Widget addXPTxt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextButton(
          child: const Text('Add XP'),
          onPressed: _addXP,
        ),
      ],
    );
  }

  Widget activityName(String name) {
    return Align(
        alignment: Alignment.center,
        child: RichText(
            text: TextSpan(
                text: name, style: TextStyle(color: textColor, fontSize: 20))));
  }

  Widget activityXPIncrease(String xpGain) {
    return Align(
        alignment: Alignment.centerRight,
        child: RichText(
            text: TextSpan(
                text: '+$xpGain XP',
                style: TextStyle(color: greenColor, fontSize: 16))));
  }

  void _addXP() {}

  void _addActivity() {
    Navigator.push(context,
        MaterialPageRoute(builder: (buildContext) => AddActivityRoute()));
  }
}
