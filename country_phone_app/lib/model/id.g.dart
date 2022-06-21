// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryIdd _$CountryIddFromJson(Map<String, dynamic> json) => CountryIdd(
      root: json['root'] as String,
      suffixes:
          (json['suffixes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CountryIddToJson(CountryIdd instance) =>
    <String, dynamic>{
      'root': instance.root,
      'suffixes': instance.suffixes,
    };
