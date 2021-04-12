import 'package:json_annotation/json_annotation.dart';

import 'weaponcore/Ammo.dart';
import 'weaponcore/Hardpoint.dart';
import 'weaponcore/Targeting.dart';


part 'Weapon.g.dart';

@JsonSerializable(explicitToJson: true)
@JsonSerializable()
class Weapon {

  late Ammo ammo;
  late Hardpoint hardpoint;
  late Targeting targeting;

  Weapon(this.ammo, this.hardpoint, this.targeting);

  factory Weapon.fromJson(Map<String, dynamic> json) => _$WeaponFromJson(json);
  Map<String, dynamic> toJson() => _$WeaponToJson(this);
}