import 'dart:math';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:graphview/GraphView.dart'
    show
        BuchheimWalkerAlgorithm,
        BuchheimWalkerConfiguration,
        Graph,
        GraphView,
        Node,
        TreeEdgeRenderer;
import '../general.dart';

class SkillTreeRoute extends StatefulWidget {
  @override
  _SkillTreeRouteState createState() => _SkillTreeRouteState();
}

class _SkillTreeRouteState extends State<SkillTreeRoute> {
  final Graph graph = Graph()..isTree = true;
  var builder = BuchheimWalkerConfiguration();
  var r = Random();

  @override
  void initState() {
    super.initState();
    var rootNode = Node(nodeWidget(1));
    graph.addNode(rootNode);
    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skill tree'),
        ),
        body: _displaySkillTree(context),
        drawer: createDrawer(context));
  }

  Widget _displaySkillTree(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  final node12 = Node(nodeWidget(r.nextInt(100)));
                  var edge =
                      graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                  print(edge);
                  graph.addEdge(edge, node12);
                  setState(() {});
                },
                child: Text('Add perk node'))
          ],
        ),
        Expanded(
            child: InteractiveViewer(
                constrained: false,
                boundaryMargin: EdgeInsets.all(100),
                minScale: 0.01,
                maxScale: 5.6,
                child: GraphView(
                  graph: graph,
                  algorithm: BuchheimWalkerAlgorithm(
                      builder, TreeEdgeRenderer(builder)),
                  paint: Paint()
                    ..color = Colors.green
                    ..strokeWidth = 1
                    ..style = PaintingStyle.stroke,
                  builder: (Node node) {
                    var a = node.key?.value as int;
                    return nodeWidget(a);
                  },
                )))
      ],
    );
  }

  Widget nodeWidget(int a) {
    return InkWell(
        onTap: () {
          print('clicked');
        },
        child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(color: Colors.red, spreadRadius: 1),
              ],
            ),
            height: 10,
            width: 10,
            child: Text('Perk name')));
  }
}
