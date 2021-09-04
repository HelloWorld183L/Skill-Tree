import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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

  Skill();
}

@JsonSerializable()
class Activity {
  @JsonKey(required: true)
  late String name;
  @JsonKey(required: true)
  late String xpGain;
  @JsonKey(required: true)
  late String difficulty;

  late String skill;

  Activity();

  factory Activity.fromJson(json) => _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
