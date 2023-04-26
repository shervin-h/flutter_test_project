import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_project/core/widgets/shared_widgets.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/bloc/countries_bloc.dart';

import '../../data/repositories/country_repository_impl.dart';


class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  static const String routeName = '/countries-screen';

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CountriesBloc>(context).add(LoadAllCountriesEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CountriesBloc, CountriesState>(
          buildWhen: (previous, current) {
            if (previous == current) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            if (state is LoadingAllCountriesState) {
              return const LottieWidget.loading();
            } else if (state is LoadAllCountriesCompletedState) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.countries.length,
                itemBuilder: (context, index) {
                  return CountryItemWidget(country: state.countries[index]);
                },
              );
            } else if (State is LoadAllCountriesErrorState) {
              return const LottieWidget.error();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class CountryItemWidget extends StatelessWidget {
  const CountryItemWidget({required this.country, Key? key}) : super(key: key);

  final CountryEntity country;

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
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
                return const Icon(CupertinoIcons.flag);
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

