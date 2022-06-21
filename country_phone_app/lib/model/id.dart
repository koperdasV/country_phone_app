import 'package:json_annotation/json_annotation.dart';

part 'id.g.dart';


@JsonSerializable()
class CountryIdd {
  String root;
  List<String> suffixes;

  CountryIdd({required this.root, required this.suffixes});

  factory CountryIdd.fromJson(Map<String, dynamic> json) =>
      _$CountryIddFromJson(json);

  Map<String, dynamic> toJson() => _$CountryIddToJson(this);

}
