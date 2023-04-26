import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';


class CountryItemWidget extends StatelessWidget {
  const CountryItemWidget({required this.country, Key? key}) : super(key: key);

  final CountryEntity country;

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: themeData.colorScheme.surfaceVariant,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.16),blurRadius: 6)
          ]
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.network(
              country.flag,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              placeholderBuilder: (context) {
                return const Center(child: Icon(CupertinoIcons.flag));
              },
            ),
          ),
        ),
        title: Text(country.name, maxLines: 1, overflow: TextOverflow.ellipsis,),
        subtitle: Text(country.capital, maxLines: 1, overflow: TextOverflow.ellipsis,),
      ),
    );
  }
}