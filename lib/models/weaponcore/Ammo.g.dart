// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ammo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ammo _$AmmoFromJson(Map<String, dynamic> json) {
  return Ammo(
    json['ammoMagazine'] as String,
    json['ammoRound'] as String,
    json['hybridRound'] as bool,
    (json['energyCost'] as num).toDouble(),
    (json['baseDamage'] as num).toDouble(),
    (json['mass'] as num).toDouble(),
    json['health'] as int,
    (json['backKickForce'] as num).toDouble(),
    (json['decayPerShot'] as num).toDouble(),
    json['hardPointUsable'] as bool,
    Damage.fromJson(json['damage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AmmoToJson(Ammo instance) => <String, dynamic>{
      'ammoMagazine': instance.ammoMagazine,
      'ammoRound': instance.ammoRound,
      'hybridRound': instance.hybridRound,
      'energyCost': instance.energyCost,
      'baseDamage': instance.baseDamage,
      'mass': instance.mass,
      'health': instance.health,
      'backKickForce': instance.backKickForce,
      'decayPerShot': instance.decayPerShot,
      'hardPointUsable': instance.hardPointUsable,
      'damage': instance.damage.toJson(),
    };
