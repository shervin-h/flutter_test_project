import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/config/app_settings/app_settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return AppBar(
      title: Text(AppLocalizations.of(context)!.appName, style: themeData.textTheme.titleMedium,),
      backgroundColor: themeData.colorScheme.background,
      actions: [
        const SizedBox(width: 4),
        IconButton(
          onPressed: () {
            BlocProvider.of<AppSettingsCubit>(context).changeThemeMode();
          },
          icon: BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context, state) {
              return Icon(state.isDark ? CupertinoIcons.sun_max : CupertinoIcons.moon);
            },
          ),
        ),
        const SizedBox(width: 4),
        BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) {
            return CupertinoSlidingSegmentedControl<String>(
              groupValue: state.languageCode,
              children: {
                'en': Text(AppLocalizations.of(context)!.english),
                'fa': Text(AppLocalizations.of(context)!.farsi),
              },
              onValueChanged: (value) {
                if (value != null) {
                  BlocProvider.of<AppSettingsCubit>(context).changeLanguage();
                }
              },
            );
          },
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
