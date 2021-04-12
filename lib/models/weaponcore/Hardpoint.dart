import 'package:json_annotation/json_annotation.dart';

import 'hardpoint/Hardware.dart';
import 'hardpoint/Loading.dart';

part 'Hardpoint.g.dart';

enum AimLeadingPrediction { Off, Basic, Accurate, Advanced }

@JsonSerializable(explicitToJson: true)
class Hardpoint {

  late String weaponName;

  late double deviateShotAngle;
  late double aimingTolerance;

  late AimLeadingPrediction aimLeadingPrediction;

  late int delayCeaseFire;

  late bool addToleranceToTracking;
  late bool canShootSubmerged;

  late Loading loading;
  late Hardware hardware;

  Hardpoint(
      this.weaponName,
      this.deviateShotAngle,
      this.aimingTolerance,
      this.aimLeadingPrediction,
      this.delayCeaseFire,
      this.addToleranceToTracking,
      this.canShootSubmerged,
      this.loading,
      this.hardware);

  factory Hardpoint.fromJson(Map<String, dynamic> json) => _$HardpointFromJson(json);
  Map<String, dynamic> toJson() => _$HardpointToJson(this);
}
