// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Targeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Targeting _$TargetingFromJson(Map<String, dynamic> json) {
  return Targeting(
    json['closestFirst'] as bool,
    json['ignoreDumbProjectiles'] as bool,
    json['lockedSmartOnly'] as bool,
    json['minimumDiameter'] as int,
    json['maximumDiameter'] as int,
    json['minimumTargetDistance'] as int,
    json['maximumTargetDistance'] as int,
    json['topTargets'] as int,
    json['topBlocks'] as int,
    json['stopTrackingSpeed'] as int,
  );
}

Map<String, dynamic> _$TargetingToJson(Targeting instance) => <String, dynamic>{
      'closestFirst': instance.closestFirst,
      'ignoreDumbProjectiles': instance.ignoreDumbProjectiles,
      'lockedSmartOnly': instance.lockedSmartOnly,
      'minimumDiameter': instance.minimumDiameter,
      'maximumDiameter': instance.maximumDiameter,
      'minimumTargetDistance': instance.minimumTargetDistance,
      'maximumTargetDistance': instance.maximumTargetDistance,
      'topTargets': instance.topTargets,
      'topBlocks': instance.topBlocks,
      'stopTrackingSpeed': instance.stopTrackingSpeed,
    };
