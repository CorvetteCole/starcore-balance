import 'package:json_annotation/json_annotation.dart';

part 'Hardware.g.dart';

enum Armor { IsWeapon, Passive, Active }

@JsonSerializable()
class Hardware {
  late double rotateRate;
  late double elevateRate;

  late int minAzimuth;
  late int maxAzimuth;

  late int minElevation;
  late int maxElevation;

  late bool fixedOffset;

  late double inventorySize;

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
}
