import 'package:json_annotation/json_annotation.dart';

part 'Loading.g.dart';

@JsonSerializable()
class Loading {
  late int rateOfFire;
  late int barrelsPerShot;
  late int trajectilesPerBarrel;

  // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).
  late int reloadTime;
  late int delayUntilFire;

  late int heatPerShot;
  late int maxHeat; //max heat before weapon enters cooldown (70% of max heat)

  //percent of max heat to be under to start firing again after overheat accepts .2-.95
  late double cooldown;

  late int heatSinkRate; //amount of heat lost per second

  // progressively lower rate of fire after 80% heat threshold (80% of max heat)
  late bool degradeRof;

  late int shotsInBurst;
  late int delayAfterBurst;
  late bool fireFullBurst;
  late bool giveUpAfterBurst;
  late int barrelSpinRate;

  Loading(
      this.rateOfFire,
      this.barrelsPerShot,
      this.trajectilesPerBarrel,
      this.reloadTime,
      this.delayUntilFire,
      this.heatPerShot,
      this.maxHeat,
      this.cooldown,
      this.heatSinkRate,
      this.degradeRof,
      this.shotsInBurst,
      this.delayAfterBurst,
      this.fireFullBurst,
      this.giveUpAfterBurst,
      this.barrelSpinRate); // visual only, 0 disables and uses RateOfFire

  factory Loading.fromJson(Map<String, dynamic> json) => _$LoadingFromJson(json);
  Map<String, dynamic> toJson() => _$LoadingToJson(this);

}
