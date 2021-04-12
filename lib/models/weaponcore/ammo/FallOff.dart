import 'package:json_annotation/json_annotation.dart';

part 'FallOff.g.dart';

@JsonSerializable()
class FallOff {

  // Distance at which max damage begins falling off.
  late double distance;
  // value from 0.0f to 1f where 0.1f would be a min damage of 10% of max damage.
  late double minMultiplier;

  FallOff(this.distance, this.minMultiplier);

  factory FallOff.fromJson(Map<String, dynamic> json) => _$FallOffFromJson(json);
  Map<String, dynamic> toJson() => _$FallOffToJson(this);
}
