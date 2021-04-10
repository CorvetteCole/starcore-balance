// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModItem _$ModItemFromJson(Map<String, dynamic> json) {
  return ModItem()
    ..friendlyName = json['friendlyName'] as String?
    ..name = json['name'] as String?
    ..publishedFileId = json['publishedFileId'] as int
    ..publishedServiceName = _$enumDecode(
        _$PublishedServiceNameEnumMap, json['publishedServiceName'])
    ..isDependency = json['isDependency'] as bool;
}

Map<String, dynamic> _$ModItemToJson(ModItem instance) => <String, dynamic>{
      'friendlyName': instance.friendlyName,
      'name': instance.name,
      'publishedFileId': instance.publishedFileId,
      'publishedServiceName':
          _$PublishedServiceNameEnumMap[instance.publishedServiceName],
      'isDependency': instance.isDependency,
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

const _$PublishedServiceNameEnumMap = {
  PublishedServiceName.STEAM: 'STEAM',
  PublishedServiceName.MODIO: 'MODIO',
  PublishedServiceName.UNKNOWN: 'UNKNOWN',
};
