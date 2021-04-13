import 'package:json_annotation/json_annotation.dart';
import 'package:starcore_balance_server/Utilities.dart';

part 'Hardware.g.dart';

enum Armor { IsWeapon, Passive, Active }

@JsonSerializable()
class Hardware {
  late double? rotateRate;
  late double? elevateRate;

  late int? minAzimuth;
  late int? maxAzimuth;

  late int? minElevation;
  late int? maxElevation;

  late bool? fixedOffset;

  late double? inventorySize;

  Armor? armor;

  Hardware(
      this.rotateRate,
      this.elevateRate,
      this.minAzimuth,
      this.maxAzimuth,
      this.minElevation,
      this.maxElevation,
      this.fixedOffset,
      this.inventorySize);

  factory Hardware.fromJson(Map<String, dynamic> json) =>
      _$HardwareFromJson(json);

  Map<String, dynamic> toJson() => _$HardwareToJson(this);

  Hardware.fromScript(List<String> hardwareList) {
    var definition = hardwareList.join('\n');
    rotateRate = parseDouble('RotateRate', definition);
    elevateRate = parseDouble('ElevateRate', definition);

    minAzimuth = parseInt('MinAzimuth', definition);
    maxAzimuth = parseInt('MaxAzimuth', definition);

    minElevation = parseInt('MinElevation', definition);
    maxElevation = parseInt('MaxElevation', definition);

    fixedOffset = parseBool('FixedOffset', definition);

    inventorySize = parseDouble('InventorySize', definition);

    switch (parseEnumString('Armor', definition)?.toLowerCase()) {
      case 'isweapon':
        armor = Armor.IsWeapon;
        break;
      case 'passive':
        armor = Armor.Passive;
        break;
      case 'active':
        armor = Armor.Active;
        break;
    }
  }
}
