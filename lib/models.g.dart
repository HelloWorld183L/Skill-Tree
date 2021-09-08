// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'id',
    'name',
    'level',
    'skillCap',
    'currentXp',
    'xpCap'
  ]);
  return Skill()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..level = json['level'] as int
    ..skillCap = json['skillCap'] as int
    ..currentXp = json['currentXp'] as int
    ..xpCap = json['xpCap'] as int;
}

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'skillCap': instance.skillCap,
      'currentXp': instance.currentXp,
      'xpCap': instance.xpCap,
    };

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'name', 'xpGain', 'difficulty']);
  return Activity()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..xpGain = json['xpGain'] as String
    ..difficulty = json['difficulty'] as String
    ..skill = json['skill'] as String;
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'xpGain': instance.xpGain,
      'difficulty': instance.difficulty,
      'skill': instance.skill,
    };
