import 'package:json_annotation/json_annotation.dart';
import 'ammo/Damage.dart';

part 'Ammo.g.dart';

@JsonSerializable(explicitToJson: true)
class Ammo {
  late String ammoMagazine;
  late String ammoRound;

  late bool hybridRound;
  late double energyCost;
  late double baseDamage;
  late double mass;

  late int health;

  late double backKickForce;
  late double decayPerShot;

  late bool hardPointUsable;

  late Damage damage;

  Ammo(
      this.ammoMagazine,
      this.ammoRound,
      this.hybridRound,
      this.energyCost,
      this.baseDamage,
      this.mass,
      this.health,
      this.backKickForce,
      this.decayPerShot,
      this.hardPointUsable,
      this.damage);

  factory Ammo.fromJson(Map<String, dynamic> json) => _$AmmoFromJson(json);

  Map<String, dynamic> toJson() => _$AmmoToJson(this);
}
