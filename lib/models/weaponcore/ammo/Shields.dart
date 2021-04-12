import 'package:json_annotation/json_annotation.dart';

part 'Shields.g.dart';

enum Type { Kinetic, Energy }

@JsonSerializable()
class Shields {
  late double modifier;
  late Type type;
  late double bypassModifier;

  Shields(this.modifier, this.type, this.bypassModifier);

  factory Shields.fromJson(Map<String, dynamic> json) => _$ShieldsFromJson(json);
  Map<String, dynamic> toJson() => _$ShieldsToJson(this);
}
