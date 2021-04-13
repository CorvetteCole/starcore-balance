// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Shields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shields _$ShieldsFromJson(Map<String, dynamic> json) {
  return Shields(
    (json['modifier'] as num?)?.toDouble(),
    _$enumDecodeNullable(_$TypeEnumMap, json['type']),
    (json['bypassModifier'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ShieldsToJson(Shields instance) => <String, dynamic>{
      'modifier': instance.modifier,
      'type': _$TypeEnumMap[instance.type],
      'bypassModifier': instance.bypassModifier,
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

const _$TypeEnumMap = {
  Type.Kinetic: 'Kinetic',
  Type.Energy: 'Energy',
};
