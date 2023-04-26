part of 'app_settings_cubit.dart';

// @immutable
class AppSettingsState {
  bool isDark;
  String languageCode;

  AppSettingsState({required this.isDark, required this.languageCode});

  AppSettingsState copyWith({
    bool? newIsDark,
    String? newLanguageCode,
  }) {
    return AppSettingsState(
      isDark: newIsDark ?? isDark,
      languageCode: newLanguageCode ?? languageCode,
    );
  }
}
