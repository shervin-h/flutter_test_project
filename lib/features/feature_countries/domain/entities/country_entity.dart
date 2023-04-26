import 'package:json_annotation/json_annotation.dart';

part 'country_entity.g.dart';

@JsonSerializable()
class CountryEntity {
  final String name;
  final String capital;
  final String flag;

  CountryEntity({required this.name, required this.capital, required this.flag});

  factory CountryEntity.fromJson(Map<String, dynamic> json) => _$CountryEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CountryEntityToJson(this);
}