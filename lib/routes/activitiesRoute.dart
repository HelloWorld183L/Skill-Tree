import 'package:flutter/material.dart';
import 'package:skill_tree/repositories/filePersistence.dart';
import 'package:skill_tree/routes/activityDetailsRoute.dart';
import 'package:skill_tree/general.dart';
import 'package:skill_tree/models.dart';

class ActivitiesRoute extends StatefulWidget {
  const ActivitiesRoute({Key? key, required this.storage}) : super(key: key);

  final FilePersistence storage;

  @override
  _ActivitiesRouteState createState() => _ActivitiesRouteState();
}

class _ActivitiesRouteState extends State<ActivitiesRoute> {
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();
    var activitiesJson = widget.storage.getJsonFile('activities.json');
    activitiesJson.then((json) {
      setState(() {
        for (var map in json) {
          var activity = Activity.fromJson(map);
          activities.add(activity);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Activities'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: foregroundColor,
          onPressed: () => _activityDetails(),
        ),
        body: _displayActivities(),
        drawer: createDrawer(context));
  }

  Widget _displayActivities() {
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
        child: Material(
            color: backgroundColor,
            child: InkWell(
                onTap: () => _activityDetails(activity: activity),
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
                        Row(
                          children: [addXPBtn(), _deleteActivityBtn(activity)],
                        )
                      ],
                    )))));
  }

  Widget addXPBtn() {
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

  Widget _deleteActivityBtn(Activity activity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextButton(
          child:
              const Text('Delete activity', style: TextStyle(color: textColor)),
          onPressed: () => _deleteActivity(activity, activities),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
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

  void _activityDetails({Activity? activity}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (buildContext) => ActivityDetailsRoute(
                storage: FilePersistence(), existingActivity: activity)));
  }

  void _deleteActivity(Activity activity, List<Activity> activities) {
    widget.storage.deleteObject(activity.toJson(), 'activities.json');
    setState(() {
      activities.remove(activity);
    });
  }
}
