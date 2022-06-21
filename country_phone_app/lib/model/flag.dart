import 'package:json_annotation/json_annotation.dart';

part 'flag.g.dart';

@JsonSerializable()
class CountryFlags {
  String svg;

  CountryFlags({required this.svg});

  factory CountryFlags.fromJson(Map<String, dynamic> json) =>
      _$CountryFlagsFromJson(json);

  Map<String, dynamic> toJson() => _$CountryFlagsToJson(this);
}
