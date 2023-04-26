
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_project/config/app_theme.dart';
import 'package:flutter_test_project/features/feature_auth/presentation/bloc/login_bloc.dart';
import 'package:flutter_test_project/features/feature_auth/presentation/screens/login_screen.dart';
import 'package:flutter_test_project/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter_test_project/screens/splash/splash_screen.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/screens/countries_screen.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/bloc/countries_bloc.dart';
import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(create: (context) => getIt<SplashBloc>()),
        BlocProvider<LoginBloc>(create: (context) => getIt<LoginBloc>()),
        BlocProvider<CountriesBloc>(create: (context) => getIt<CountriesBloc>())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fa'), // Farsi
      ],
      locale: const Locale('en'),
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      home: const LoginScreen(),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CountriesScreen.routeName: (context) => const CountriesScreen(),
      },
    );
  }
}



