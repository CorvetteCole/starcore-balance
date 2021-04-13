// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weapon _$WeaponFromJson(Map<String, dynamic> json) {
  return Weapon(
    (json['ammo'] as List<dynamic>)
        .map((e) => Ammo.fromJson(e as Map<String, dynamic>))
        .toSet(),
    Hardpoint.fromJson(json['hardpoint'] as Map<String, dynamic>),
    Targeting.fromJson(json['targeting'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeaponToJson(Weapon instance) => <String, dynamic>{
      'ammo': instance.ammo.map((e) => e.toJson()).toList(),
      'hardpoint': instance.hardpoint.toJson(),
      'targeting': instance.targeting.toJson(),
    };
