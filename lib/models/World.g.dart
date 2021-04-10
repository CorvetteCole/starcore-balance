// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'World.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

World _$WorldFromJson(Map<String, dynamic> json) {
  return World()
    ..sessionName = json['sessionName'] as String?
    ..lastSaveTime = json['lastSaveTime'] == null
        ? null
        : DateTime.parse(json['lastSaveTime'] as String)
    ..settings = json['settings'] as Map<String, dynamic>
    ..mods = (json['mods'] as List<dynamic>)
        .map((e) => ModItem.fromJson(e as Map<String, dynamic>))
        .toList()
    ..mapId = json['mapId'] as int;
}

Map<String, dynamic> _$WorldToJson(World instance) => <String, dynamic>{
      'sessionName': instance.sessionName,
      'lastSaveTime': instance.lastSaveTime?.toIso8601String(),
      'settings': instance.settings,
      'mods': instance.mods.map((e) => e.toJson()).toList(),
      'mapId': instance.mapId,
    };
