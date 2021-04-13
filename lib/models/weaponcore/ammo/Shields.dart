import 'package:json_annotation/json_annotation.dart';
import 'package:starcore_balance_server/Utilities.dart';

part 'Shields.g.dart';

enum Type { Kinetic, Energy }

@JsonSerializable()
class Shields {
  late double? modifier;
  Type? type;
  late double? bypassModifier;

  Shields(this.modifier, this.type, this.bypassModifier);

  factory Shields.fromJson(Map<String, dynamic> json) => _$ShieldsFromJson(json);
  Map<String, dynamic> toJson() => _$ShieldsToJson(this);

  Shields.fromScript(List<String> definitionList){
    var definition = definitionList.join('\n');
    modifier = parseDouble('Modifier', definition);
    switch(parseEnumString('Type', definition)?.toLowerCase()){
      case 'kinetic':
        type = Type.Kinetic;
        break;
      case 'energy':
        type = Type.Energy;
        break;
    }
    bypassModifier = parseDouble('BypassModifier', definition);
  }
}
