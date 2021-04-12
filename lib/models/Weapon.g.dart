// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weapon _$WeaponFromJson(Map<String, dynamic> json) {
  return Weapon(
    Ammo.fromJson(json['ammo'] as Map<String, dynamic>),
    Hardpoint.fromJson(json['hardpoint'] as Map<String, dynamic>),
    Targeting.fromJson(json['targeting'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeaponToJson(Weapon instance) => <String, dynamic>{
      'ammo': instance.ammo.toJson(),
      'hardpoint': instance.hardpoint.toJson(),
      'targeting': instance.targeting.toJson(),
    };
