// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryEntity _$CountryEntityFromJson(Map<String, dynamic> json) =>
    CountryEntity(
      name: json['name'] as String,
      capital: json['capital'] as String,
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$CountryEntityToJson(CountryEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'capital': instance.capital,
      'flag': instance.flag,
    };
