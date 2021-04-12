// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FallOff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FallOff _$FallOffFromJson(Map<String, dynamic> json) {
  return FallOff(
    (json['distance'] as num).toDouble(),
    (json['minMultiplier'] as num).toDouble(),
  );
}

Map<String, dynamic> _$FallOffToJson(FallOff instance) => <String, dynamic>{
      'distance': instance.distance,
      'minMultiplier': instance.minMultiplier,
    };
