import 'package:flutter/material.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/profile/presentation/widget/profile/profile_card.dart';
import 'package:roomly/features/settings/presentation/widget/settings/preferences_card.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.profile.name;
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return ScreenLayoutWidget(verPadding: 0, children: [
      ProfileCard().asSliver(),
      ScreenSpacer(),
      ScreenSpacer(),
      PreferencesCard().asSliver(),
    ]);
  }
}
