import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/Theme/theme_cubit.dart';
import 'package:roomly/core/Theme/theme_state.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locale_cubit.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/settings/presentation/widget/settings/settings_item.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/interactive_widgets/segmented_button.dart';

class PreferencesCard extends StatelessWidget {
  final double padding;
  const PreferencesCard({super.key, this.padding = mobileHozPadding});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = context.t;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsetsDirectional.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        children: [
          BlocBuilder<ThemeCubit, ThemeState>(
              builder: (c, st) => SettingsItem.List(
                    value: st.theme,
                    item: SegmentOption(
                        value: st.theme, label: tr.system, icon: Roomly.system),
                    onTap: (theme) =>
                        context.read<ThemeCubit>().changeTheme(theme),
                    options: [
                      SegmentOption(
                          value: ThemeMode.light,
                          label: tr.lightMode,
                          icon: Roomly.light),
                      SegmentOption(
                          value: ThemeMode.dark,
                          label: tr.darkMode,
                          icon: Roomly.dark),
                      SegmentOption(
                          value: ThemeMode.system,
                          label: tr.system,
                          icon: Roomly.system),
                    ],
                  )),
          BlocBuilder<LocaleCubit, Locale>(
              builder: (c, st) => SettingsItem.List(
                    value: st.languageCode,
                    item: SegmentOption(
                        value: st.languageCode,
                        label: tr.appLanguage,
                        icon: Roomly.language),
                    onTap: (code) =>
                        context.read<LocaleCubit>().setLocale(code),
                    isLast: true,
                    options: const [
                      SegmentOption(
                          value: 'ar', label: 'العربية', icon: Roomly.language),
                      SegmentOption(
                          value: 'en', label: 'English', icon: Roomly.language),
                    ],
                  )),
        ],
      ),
    );
  }
}
