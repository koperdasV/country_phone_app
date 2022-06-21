import 'package:json_annotation/json_annotation.dart';

part 'name.g.dart';

@JsonSerializable()
class CountryName {
  final String common;

  CountryName({required this.common});

  factory CountryName.fromJson(Map<String, dynamic> json) =>
      _$CountryNameFromJson(json);

  Map<String, dynamic> toJson() => _$CountryNameToJson(this);
}
