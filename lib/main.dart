import 'package:flutter/material.dart';

const backgroundColor = Color.fromRGBO(22, 25, 37, 1);
const textColor = Color.fromRGBO(22, 25, 37, 1);
const greenColor = Color.fromRGBO(96, 184, 61, 1);
const progressColor = Color.fromRGBO(230, 115, 15, 1);
const foregroundColor = Color.fromRGBO(48, 51, 61, 1);

const textStyle = const TextStyle(color: textColor);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skill tree',
      theme: ThemeData(
        primaryColor: backgroundColor,
        textTheme: const TextTheme(bodyText2: textStyle, bodyText1: textStyle)
      ),
      home: ActivitiesRoute()
    );
  }
}

class ActivitiesRoute extends StatefulWidget {
  @override
  _ActivitiesRouteState createState() => _ActivitiesRouteState();
}

class _ActivitiesRouteState extends State<ActivitiesRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      floatingActionButton:  FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: foregroundColor,
        onPressed: _addActivity,
      ),

      body: _displayActivities(),
      drawer: _createDrawer()
    );
  }

  Widget _createDrawer() {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.computer),
            title: Text('Activities'),
          ),
          ListTile(
            leading: Icon(Icons.piano),
            title: Text('Skills'),
          ),
          ListTile(
            leading: Icon(Icons.auto_graph),
            title: Text('Statistics'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ]
      )
    );
  }

  Widget _displayActivities() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 94,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              activityName(),
                              Spacer(),
                              activityXPIncrease(),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          addXPTxt()
                        ],
                      )
                    )
                  )
                );
              }
            )
          )
        ],
      )
    );
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

  Widget activityName() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: 'Activity name (0/1000)',
          style: TextStyle(color: textColor, fontSize: 20)
        )
      )
    );
  }

  Widget activityXPIncrease() {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          text: '+0 XP',
          style: TextStyle(color: greenColor, fontSize: 16)
        )
      )
    );
  }

  void _addXP() {

  }

  void _addActivity() {

  }
}
