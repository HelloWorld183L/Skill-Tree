import 'package:flutter/material.dart';
import 'routes/activitiesRoute.dart';
import 'general.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skill tree',
        theme: ThemeData(
          primaryColor: backgroundColor,
        ),
        home: ActivitiesRoute());
  }
}
