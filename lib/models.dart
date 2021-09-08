import 'package:json_annotation/json_annotation.dart';
import 'package:skill_tree/repositories/filePersistence.dart';

part 'models.g.dart';

class PerkNode {
  late String name;
  late int levelRequirement;
  late List<PerkNode> children;
}

class SkillTree {
  late PerkNode headNode;
}

@JsonSerializable()
class Skill {
  @JsonKey(required: true)
  late int id = 0;
  @JsonKey(required: true)
  late String name = '';
  @JsonKey(required: true)
  late int level = 1;
  @JsonKey(required: true)
  late int skillCap = 100;
  @JsonKey(required: true)
  late int currentXp = 0;
  @JsonKey(required: true)
  late int xpCap = 100;
  //late SkillTree skillTree;

  Skill() {
    final filePersistence = FilePersistence();
    final objectLengthFuture =
        filePersistence.getJsonObjectLength('skills.json');
    objectLengthFuture.then((value) {
      if (id == 0) id = value + 1;
    });
  }

  factory Skill.fromJson(json) => _$SkillFromJson(json);
  Map<String, dynamic> toJson() => _$SkillToJson(this);
}

@JsonSerializable()
class Activity {
  @JsonKey(required: true)
  late int id = 0;
  @JsonKey(required: true)
  late String name = '';
  @JsonKey(required: true)
  late String xpGain = '';
  @JsonKey(required: true)
  late String difficulty = '';

  late String skill = '';

  Activity() {
    final filePersistence = FilePersistence();
    final objectLengthFuture =
        filePersistence.getJsonObjectLength('activities.json');
    // BE WARNED. This is concurrency territory
    // For some reason, .then gets called TWICE (skipping past the above code) and I have NO IDEA WHY?!?!?!?!?!
    // https://flutterigniter.com/future-async-called-multiple-times/ possible explanation
    objectLengthFuture.then((value) {
      if (id == 0) id = value + 1;
    });
  }

  factory Activity.fromJson(json) => _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
