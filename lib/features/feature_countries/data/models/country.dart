import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';

class Country extends CountryEntity {
  Country({
    required String name,
    required String capital,
    required String flag,
  })
      : super(
          name: name,
          capital: capital,
          flag: flag,
        );

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json['name'], capital: json['capital'], flag: json['flag']);
  }
}
