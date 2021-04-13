import 'package:json_annotation/json_annotation.dart';
import 'package:starcore_balance_server/Utilities.dart';

part 'Targeting.g.dart';

@JsonSerializable()
class Targeting {

  // TODO: add subsystems and threats

  late bool? closestFirst;
  late bool? ignoreDumbProjectiles;
  late bool? lockedSmartOnly;

  // engagement radius (0 = unlimited)
  late int? minimumDiameter;
  late int? maximumDiameter;

  // threat targeting radius (0 = unlimited)
  late int? minimumTargetDistance;
  late int? maximumTargetDistance;

  // max number of top targets to randomize between (0 = unlimited)
  late int? topTargets;

  // max number of blocks to randomize between (0 = unlimited)
  late int? topBlocks;

  // do not track target threats traveling faster than this speed (0 = unlimited)
  late int? stopTrackingSpeed;

  Targeting(
      this.closestFirst,
      this.ignoreDumbProjectiles,
      this.lockedSmartOnly,
      this.minimumDiameter,
      this.maximumDiameter,
      this.minimumTargetDistance,
      this.maximumTargetDistance,
      this.topTargets,
      this.topBlocks,
      this.stopTrackingSpeed);

  factory Targeting.fromJson(Map<String, dynamic> json) => _$TargetingFromJson(json);
  Map<String, dynamic> toJson() => _$TargetingToJson(this);

  Targeting.fromScript(List<String> definitionList){
    var definition = definitionList.join('\n');
    closestFirst = parseBool('ClosestFirst', definition);
    ignoreDumbProjectiles = parseBool('IgnoreDumbProjects', definition);
    lockedSmartOnly = parseBool('LockedSmartOnly', definition);

    minimumDiameter = parseInt('MinimumDiameter', definition);
    maximumDiameter = parseInt('MaximumDiameter', definition);

    minimumTargetDistance = parseInt('MinTargetDistance', definition);
    maximumTargetDistance = parseInt('MaxTargetDistance', definition);

    topTargets = parseInt('TopTargets', definition);
    topBlocks = parseInt('TopBlocks', definition);

    stopTrackingSpeed = parseInt('StopTrackingSpeed', definition);
  }

}
