// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Damage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Damage _$DamageFromJson(Map<String, dynamic> json) {
  return Damage(
    (json['maxIntegrity'] as num).toDouble(),
    json['damageVoxels'] as bool,
    json['selfDamage'] as bool,
    (json['healthHitModifier'] as num).toDouble(),
    (json['voxelHitModifier'] as num).toDouble(),
    (json['characters'] as num).toDouble(),
    FallOff.fromJson(json['fallOff'] as Map<String, dynamic>),
    Grids.fromJson(json['grids'] as Map<String, dynamic>),
    Armor.fromJson(json['armor'] as Map<String, dynamic>),
    Shields.fromJson(json['shields'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DamageToJson(Damage instance) => <String, dynamic>{
      'maxIntegrity': instance.maxIntegrity,
      'damageVoxels': instance.damageVoxels,
      'selfDamage': instance.selfDamage,
      'healthHitModifier': instance.healthHitModifier,
      'voxelHitModifier': instance.voxelHitModifier,
      'characters': instance.characters,
      'fallOff': instance.fallOff.toJson(),
      'grids': instance.grids.toJson(),
      'armor': instance.armor.toJson(),
      'shields': instance.shields.toJson(),
    };
