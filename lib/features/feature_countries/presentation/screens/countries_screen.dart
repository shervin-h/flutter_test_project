import 'package:flutter/material.dart';


class CountriesScreen extends StatelessWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  static const String routeName = '/countries-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Countries Screen'),
        ),
      ),
    );
  }
}
