import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';
import 'country_item_tablet_widget.dart';
import 'country_item_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CountriesListWidget extends StatelessWidget {
  const CountriesListWidget({required this.countries, Key? key}) : super(key: key);

  final List<CountryEntity> countries;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: CountryItemWidget(country: countries[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CountriesListTabletWidget extends StatelessWidget {
  const CountriesListTabletWidget({required this.countries, Key? key}) : super(key: key);

  final List<CountryEntity> countries;

  @override
  Widget build(BuildContext context) {
    const int crossAxisColumnCount = 2;

    return AnimationLimiter(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisColumnCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 5 / 2,
        ),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            columnCount: crossAxisColumnCount,
            position: index,
            duration: const Duration(milliseconds: 375),
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: CountryItemTabletWidget(country: countries[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
