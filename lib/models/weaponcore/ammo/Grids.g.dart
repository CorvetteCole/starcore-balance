// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Grids.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grids _$GridsFromJson(Map<String, dynamic> json) {
  return Grids(
    (json['large'] as num?)?.toDouble(),
    (json['small'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$GridsToJson(Grids instance) => <String, dynamic>{
      'large': instance.large,
      'small': instance.small,
    };
