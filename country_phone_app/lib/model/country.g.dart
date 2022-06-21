// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: CountryName.fromJson(json['name'] as Map<String, dynamic>),
      idd: CountryIdd.fromJson(json['idd'] as Map<String, dynamic>),
      flags: CountryFlags.fromJson(json['flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'idd': instance.idd,
      'flags': instance.flags,
    };
