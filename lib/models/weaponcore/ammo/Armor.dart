import 'package:json_annotation/json_annotation.dart';
import 'package:starcore_balance_server/Utilities.dart';

part 'Armor.g.dart';

@JsonSerializable()
class Armor {
  late double? armor;
  late double? light;
  late double? heavy;
  late double? nonArmor;

  Armor(this.armor, this.light, this.heavy, this.nonArmor);

  factory Armor.fromJson(Map<String, dynamic> json) => _$ArmorFromJson(json);

  Map<String, dynamic> toJson() => _$ArmorToJson(this);

  Armor.fromScript(List<String> definitionList){
    var definition = definitionList.join('\n');
    armor = parseDouble('Armor', definition);
    light = parseDouble('Light', definition);
    heavy = parseDouble('Heavy', definition);
    nonArmor = parseDouble('NonArmor', definition);
  }
}
