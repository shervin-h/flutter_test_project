import 'package:flutter/material.dart';

class AppTheme {
  // color scheme
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006876),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFA1EFFF),
    onPrimaryContainer: Color(0xFF001F25),
    secondary: Color(0xFFB02F00),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFDBD1),
    onSecondaryContainer: Color(0xFF3B0900),
    tertiary: Color(0xFFBC004B),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD9DE),
    onTertiaryContainer: Color(0xFF400014),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFCFD),
    onBackground: Color(0xFF191C1D),
    surface: Color(0xFFFBFCFD),
    onSurface: Color(0xFF191C1D),
    surfaceVariant: Color(0xFFDBE4E6),
    onSurfaceVariant: Color(0xFF3F484A),
    outline: Color(0xFF6F797B),
    onInverseSurface: Color(0xFFEFF1F2),
    inverseSurface: Color(0xFF2E3132),
    inversePrimary: Color(0xFF44D8F1),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006876),
    outlineVariant: Color(0xFFBFC8CA),
    scrim: Color(0xFF000000),
  );
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF44D8F1),
    onPrimary: Color(0xFF00363E),
    primaryContainer: Color(0xFF004E59),
    onPrimaryContainer: Color(0xFFA1EFFF),
    secondary: Color(0xFFFFB5A0),
    onSecondary: Color(0xFF5F1500),
    secondaryContainer: Color(0xFF862200),
    onSecondaryContainer: Color(0xFFFFDBD1),
    tertiary: Color(0xFFFFB2BE),
    onTertiary: Color(0xFF660025),
    tertiaryContainer: Color(0xFF900038),
    onTertiaryContainer: Color(0xFFFFD9DE),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1D),
    onBackground: Color(0xFFE1E3E3),
    surface: Color(0xFF191C1D),
    onSurface: Color(0xFFE1E3E3),
    surfaceVariant: Color(0xFF3F484A),
    onSurfaceVariant: Color(0xFFBFC8CA),
    outline: Color(0xFF899295),
    onInverseSurface: Color(0xFF191C1D),
    inverseSurface: Color(0xFFE1E3E3),
    inversePrimary: Color(0xFF006876),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF44D8F1),
    outlineVariant: Color(0xFF3F484A),
    scrim: Color(0xFF000000),
  );

  // font family
  static const String fontFamilyName = 'Vazir';
  static const Color lightFontColor = Color(0xFF2E2E2E);
  static const Color darkFontColor = Colors.white;

  // text theme
  static const TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    headlineMedium: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    headlineSmall: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    displayLarge: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    displayMedium: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    displaySmall: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    titleLarge: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    titleMedium: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    titleSmall: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    bodyLarge: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    bodyMedium: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    bodySmall: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    labelLarge: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    labelMedium: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
    labelSmall: TextStyle(fontFamily: fontFamilyName, color: lightFontColor),
  );
  static const TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    headlineMedium: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    headlineSmall: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    displayLarge: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    displayMedium: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    displaySmall: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    titleLarge: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    titleMedium: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    titleSmall: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    bodyLarge: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    bodyMedium: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    bodySmall: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    labelLarge: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    labelMedium: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
    labelSmall: TextStyle(fontFamily: fontFamilyName, color: darkFontColor),
  );

  // theme data
  static ThemeData lightThemeData = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: lightColorScheme,
    textTheme: lightTextTheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    )
  );

  static ThemeData darkThemeData = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: darkColorScheme,
    textTheme: darkTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      )
  );
}