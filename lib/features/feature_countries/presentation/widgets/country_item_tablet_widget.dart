import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';

class CountryItemTabletWidget extends StatelessWidget {
  const CountryItemTabletWidget({required this.country, Key? key}) : super(key: key);

  final CountryEntity country;

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final themeData = Theme.of(context);

    const double radius = 4;

    return Container(
      decoration: BoxDecoration(
          color: themeData.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 6)]),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: SvgPicture.network(
              country.flag,
              fit: BoxFit.cover,
              placeholderBuilder: (context) {
                return const Center(child: Icon(CupertinoIcons.flag));
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  themeData.colorScheme.background.withOpacity(0.9),
                  themeData.colorScheme.background.withOpacity(0.4),
                  // Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country.name,
                  style: themeData.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(color: themeData.colorScheme.background.withOpacity(0.9), blurRadius: 4),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  country.capital,
                  style: themeData.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(color: themeData.colorScheme.background.withOpacity(0.9), blurRadius: 4),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
