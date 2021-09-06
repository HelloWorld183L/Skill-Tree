// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
