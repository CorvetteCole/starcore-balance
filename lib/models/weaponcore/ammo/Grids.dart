import 'package:json_annotation/json_annotation.dart';
import 'package:starcore_balance_server/Utilities.dart';

part 'Grids.g.dart';

@JsonSerializable()
class Grids {

  late double? large;
  late double? small;

  Grids(this.large, this.small);

  factory Grids.fromJson(Map<String, dynamic> json) => _$GridsFromJson(json);
  Map<String, dynamic> toJson() => _$GridsToJson(this);

  Grids.fromScript(List<String> definitionList){
    var definition = definitionList.join('\n');
    large = parseDouble('Large', definition);
    small = parseDouble('Small', definition);
  }
}