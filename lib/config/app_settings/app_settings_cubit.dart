import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsState(isDark: true, languageCode: 'en'));

  changeThemeMode() {
    if (state.isDark) {
      emit(state.copyWith(newIsDark: false));
    } else {
      emit(state.copyWith(newIsDark: true));
    }
  }

  changeLanguage() {
    if (state.languageCode == 'en') {
      emit(state.copyWith(newLanguageCode: 'fa'));
    } else {
      emit(state.copyWith(newLanguageCode: 'en'));
    }
  }
}
