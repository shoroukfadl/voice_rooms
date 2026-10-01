import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/profile/presentation/widget/settings/settings_item.dart';
import 'package:roomly/utilities/constants/constants.dart';
import 'package:roomly/utilities/roomly.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(pillsRadius),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsItem(
              onTap: () {},
              icon: Roomly.editProfile,
              label: "Strings.editProfile.translate"),
          SettingsItem(
              onTap: () {},
              icon: Roomly.forgot,
              label: "Strings.changePassword.translate"),
          SettingsItem(
              onTap: () {},
              icon: Roomly.secuirty,
              label: "Strings.securityTwoFactor.translate"),
          SettingsItem(
              onTap: () {},
              icon: Roomly.explore,
              label: "Strings.aiSummaryPreferences.translate"),
          SettingsItem(
              onTap: () {},
              icon: Roomly.secuirty,
              isLast: true,
              label: "Strings.downloadsAndStorage.translate"),
        ],
      ),
    );
  }
}
