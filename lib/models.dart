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

class Skill {
  late String name;
  late int level;
  late int skillCap;
  late int currentXp;
  late int xpCap;
  late SkillTree skillTree;

  Skill();
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
