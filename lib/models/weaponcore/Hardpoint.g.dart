// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hardpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hardpoint _$HardpointFromJson(Map<String, dynamic> json) {
  return Hardpoint(
    json['weaponName'] as String?,
    (json['deviateShotAngle'] as num?)?.toDouble(),
    (json['aimingTolerance'] as num?)?.toDouble(),
    _$enumDecodeNullable(
        _$AimLeadingPredictionEnumMap, json['aimLeadingPrediction']),
    json['delayCeaseFire'] as int?,
    json['addToleranceToTracking'] as bool?,
    Loading.fromJson(json['loading'] as Map<String, dynamic>),
    Hardware.fromJson(json['hardware'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HardpointToJson(Hardpoint instance) => <String, dynamic>{
      'weaponName': instance.weaponName,
      'deviateShotAngle': instance.deviateShotAngle,
      'aimingTolerance': instance.aimingTolerance,
      'aimLeadingPrediction':
          _$AimLeadingPredictionEnumMap[instance.aimLeadingPrediction],
      'delayCeaseFire': instance.delayCeaseFire,
      'addToleranceToTracking': instance.addToleranceToTracking,
      'loading': instance.loading.toJson(),
      'hardware': instance.hardware.toJson(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$AimLeadingPredictionEnumMap = {
  AimLeadingPrediction.Off: 'Off',
  AimLeadingPrediction.Basic: 'Basic',
  AimLeadingPrediction.Accurate: 'Accurate',
  AimLeadingPrediction.Advanced: 'Advanced',
};
