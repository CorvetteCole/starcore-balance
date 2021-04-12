import 'package:json_annotation/json_annotation.dart';

part 'Grids.g.dart';

@JsonSerializable()
class Grids {

  late double large;
  late double small;

  Grids(this.large, this.small);

  factory Grids.fromJson(Map<String, dynamic> json) => _$GridsFromJson(json);
  Map<String, dynamic> toJson() => _$GridsToJson(this);
}