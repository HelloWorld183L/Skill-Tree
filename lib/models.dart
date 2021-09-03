import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

class PerkNode {
  late String name;
  late int levelRequirement;
  late List<PerkNode> children;
}

class SkillTree {
  late PerkNode headNode;
}

class Skill {
  late String name;
  late int level;
  late int skillCap;
  late SkillTree skillTree;
}

@JsonSerializable()
class Activity {
  late String name;
  late int xpGain;
  late String difficulty;
  // TODO: Change the String to Skill
  late String skill;

  Activity(this.name, this.xpGain, this.difficulty);

  factory Activity.fromJson(json) => _$ActivityToJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
