// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Loading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loading _$LoadingFromJson(Map<String, dynamic> json) {
  return Loading(
    json['rateOfFire'] as int?,
    json['barrelsPerShot'] as int?,
    json['trajectilesPerBarrel'] as int?,
    json['reloadTime'] as int?,
    json['delayUntilFire'] as int?,
    json['heatPerShot'] as int?,
    json['maxHeat'] as int?,
    (json['cooldown'] as num?)?.toDouble(),
    json['heatSinkRate'] as int?,
    json['degradeRof'] as bool?,
    json['shotsInBurst'] as int?,
    json['delayAfterBurst'] as int?,
    json['fireFullBurst'] as bool?,
    json['giveUpAfterBurst'] as bool?,
    json['barrelSpinRate'] as int?,
  );
}

Map<String, dynamic> _$LoadingToJson(Loading instance) => <String, dynamic>{
      'rateOfFire': instance.rateOfFire,
      'barrelsPerShot': instance.barrelsPerShot,
      'trajectilesPerBarrel': instance.trajectilesPerBarrel,
      'reloadTime': instance.reloadTime,
      'delayUntilFire': instance.delayUntilFire,
      'heatPerShot': instance.heatPerShot,
      'maxHeat': instance.maxHeat,
      'cooldown': instance.cooldown,
      'heatSinkRate': instance.heatSinkRate,
      'degradeRof': instance.degradeRof,
      'shotsInBurst': instance.shotsInBurst,
      'delayAfterBurst': instance.delayAfterBurst,
      'fireFullBurst': instance.fireFullBurst,
      'giveUpAfterBurst': instance.giveUpAfterBurst,
      'barrelSpinRate': instance.barrelSpinRate,
    };
