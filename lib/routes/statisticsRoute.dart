import 'package:flutter/material.dart';
import 'package:skill_tree/general.dart';

class StatisticsRoute extends StatefulWidget {
  @override
  _StatisticsRouteState createState() => _StatisticsRouteState();
}

class _StatisticsRouteState extends State<StatisticsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Statistics'),
        ),
        body: _displayStatistics(),
        drawer: createDrawer(context));
  }

  Widget _displayStatistics() {
    return Container();
  }
}
