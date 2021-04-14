// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weapon _$WeaponFromJson(Map<String, dynamic> json) {
  return Weapon(
    (json['ammo'] as List<dynamic>)
        .map((e) => Ammo.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['hardpoint'] == null
        ? null
        : Hardpoint.fromJson(json['hardpoint'] as Map<String, dynamic>),
    json['targeting'] == null
        ? null
        : Targeting.fromJson(json['targeting'] as Map<String, dynamic>),
  )..subTypeId = json['subTypeId'] as String;
}

Map<String, dynamic> _$WeaponToJson(Weapon instance) => <String, dynamic>{
      'ammo': instance.ammo.map((e) => e.toJson()).toList(),
      'subTypeId': instance.subTypeId,
      'hardpoint': instance.hardpoint?.toJson(),
      'targeting': instance.targeting?.toJson(),
    };
