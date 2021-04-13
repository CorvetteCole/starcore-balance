// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Armor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Armor _$ArmorFromJson(Map<String, dynamic> json) {
  return Armor(
    (json['armor'] as num?)?.toDouble(),
    (json['light'] as num?)?.toDouble(),
    (json['heavy'] as num?)?.toDouble(),
    (json['nonArmor'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ArmorToJson(Armor instance) => <String, dynamic>{
      'armor': instance.armor,
      'light': instance.light,
      'heavy': instance.heavy,
      'nonArmor': instance.nonArmor,
    };
