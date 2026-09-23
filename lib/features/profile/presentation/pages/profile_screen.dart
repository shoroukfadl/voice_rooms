import 'package:flutter/material.dart';
import 'package:voice_rooms/features/profile/presentation/widget/profile/profile_card.dart';
import 'package:voice_rooms/features/profile/presentation/widget/settings/actions_widget.dart';
import 'package:voice_rooms/features/profile/presentation/widget/settings/preferences_card.dart';
import 'package:voice_rooms/features/profile/presentation/widget/settings/settings_card.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/helper/screen_spacer.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.profile.name;
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(children: [
      ProfileCard().asSliver(),
      ScreenSpacer(),
      PreferencesCard().asSliver(),
      ScreenSpacer(),
      SettingsCard().asSliver(),
      ScreenSpacer(),
      ActionsCard().asSliver(),
    ]);
  }
}
