// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hardware.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hardware _$HardwareFromJson(Map<String, dynamic> json) {
  return Hardware(
    (json['rotateRate'] as num?)?.toDouble(),
    (json['elevateRate'] as num?)?.toDouble(),
    json['minAzimuth'] as int?,
    json['maxAzimuth'] as int?,
    json['minElevation'] as int?,
    json['maxElevation'] as int?,
    json['fixedOffset'] as bool?,
    (json['inventorySize'] as num?)?.toDouble(),
  )..armor = _$enumDecode(_$ArmorEnumMap, json['armor']);
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
      'armor': _$ArmorEnumMap[instance.armor],
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

const _$ArmorEnumMap = {
  Armor.IsWeapon: 'IsWeapon',
  Armor.Passive: 'Passive',
  Armor.Active: 'Active',
};
