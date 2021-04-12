// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hardware.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hardware _$HardwareFromJson(Map<String, dynamic> json) {
  return Hardware(
    (json['rotateRate'] as num).toDouble(),
    (json['elevateRate'] as num).toDouble(),
    json['minAzimuth'] as int,
    json['maxAzimuth'] as int,
    json['minElevation'] as int,
    json['maxElevation'] as int,
    json['fixedOffset'] as bool,
    (json['inventorySize'] as num).toDouble(),
  );
}

Map<String, dynamic> _$HardwareToJson(Hardware instance) => <String, dynamic>{
      'rotateRate': instance.rotateRate,
      'elevateRate': instance.elevateRate,
      'minAzimuth': instance.minAzimuth,
      'maxAzimuth': instance.maxAzimuth,
      'minElevation': instance.minElevation,
      'maxElevation': instance.maxElevation,
      'fixedOffset': instance.fixedOffset,
      'inventorySize': instance.inventorySize,
    };
