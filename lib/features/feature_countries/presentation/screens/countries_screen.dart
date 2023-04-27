import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_project/core/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/core/widgets/shared_widgets.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/bloc/countries_bloc.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/widgets/country_item_tablet_widget.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/widgets/country_item_widget.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/widgets/country_screens.dart';


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
      appBar: const CustomAppBar(),
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
              final countries = state.countries;
              return OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.portrait) {
                    return CountriesListWidget(countries: countries);
                  } else {
                    return CountriesListTabletWidget(countries: countries);
                  }
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

