// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['name', 'xpGain', 'difficulty']);
  return Activity(
    json['name'] as String,
    json['xpGain'] as String,
    json['difficulty'] as String,
  )..skill = json['skill'] as String;
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'name': instance.name,
      'xpGain': instance.xpGain,
      'difficulty': instance.difficulty,
      'skill': instance.skill,
    };
