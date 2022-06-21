import 'package:country_phone_app/model/flag.dart';
import 'package:country_phone_app/model/id.dart';
import 'package:country_phone_app/model/name.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  final CountryName name;
  final CountryIdd idd;
  final CountryFlags flags;

  const Country({
    required this.name,
    required this.idd,
    required this.flags,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
