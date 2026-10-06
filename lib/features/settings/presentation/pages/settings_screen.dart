import 'package:flutter/material.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/settings/presentation/widget/settings/actions_widget.dart';
import 'package:roomly/features/settings/presentation/widget/settings/preferences_card.dart';
import 'package:roomly/features/settings/presentation/widget/settings/settings_card.dart';
import 'package:roomly/features/settings/presentation/widget/settings/title.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.settings.name;
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return ScreenLayoutWidget(children: [
      SettingsCard().asSliver(),
      ScreenSpacer(),
      PreferencesCard().asSliver(),
      ScreenSpacer(),
      TitleWidget(title: tr.account).asPaddedSliver(),
      CustomSpacer.S().asSliver(),
      ActionsCard().asSliver(),
    ]);
  }
}
