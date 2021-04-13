import 'package:json_annotation/json_annotation.dart';

import 'hardpoint/Hardware.dart';
import 'hardpoint/Loading.dart';
import '../../Utilities.dart';

part 'Hardpoint.g.dart';

enum AimLeadingPrediction { Off, Basic, Accurate, Advanced }

@JsonSerializable(explicitToJson: true)
class Hardpoint {

  late String? weaponName;

  late double? deviateShotAngle;
  late double? aimingTolerance;

  AimLeadingPrediction? aimLeadingPrediction;

  late int? delayCeaseFire;

  late bool? addToleranceToTracking;

  late Loading loading;
  late Hardware hardware;

  Hardpoint(
      this.weaponName,
      this.deviateShotAngle,
      this.aimingTolerance,
      this.aimLeadingPrediction,
      this.delayCeaseFire,
      this.addToleranceToTracking,
      this.loading,
      this.hardware);

  factory Hardpoint.fromJson(Map<String, dynamic> json) => _$HardpointFromJson(json);
  Map<String, dynamic> toJson() => _$HardpointToJson(this);

  // TODO convert to use single string
  Hardpoint.fromScript(List<String> definitionList){
    var definition = definitionList.join('\n');

    weaponName = parseString('WeaponName', definition);

    deviateShotAngle = parseDouble('DeviateShotAngle', definition);
    aimingTolerance = parseDouble('AimingTolerance', definition);

    switch (parseEnumString('AimLeadingPrediction', definition)?.toLowerCase()) {
      case 'off':
        aimLeadingPrediction = AimLeadingPrediction.Off;
        break;
      case 'basic':
        aimLeadingPrediction = AimLeadingPrediction.Basic;
        break;
      case 'accurate':
        aimLeadingPrediction = AimLeadingPrediction.Accurate;
        break;
      case 'advanced':
        aimLeadingPrediction = AimLeadingPrediction.Advanced;
        break;
    }

    delayCeaseFire = parseInt('DelayCeaseFire', definition);

    addToleranceToTracking = parseBool('AddToleranceToTracking', definition);

    var hardwareList = getCodeBlock('new HardwareDef', definitionList);
    var loadingList = getCodeBlock('new LoadingDef', definitionList);

    hardware = Hardware.fromScript(hardwareList);
    loading = Loading.fromScript(loadingList);
  }

}
