import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/profile/presentation/widget/settings/settings_item.dart';
import 'package:roomly/utilities/constants/constants.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/roomly.dart';

class ActionsCard extends StatelessWidget {
  const ActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsItem(
              onTap: () {},
              icon: Roomly.logout,
              color: colors.secondary,
              label: Strings.logout.translate),
          SettingsItem(
              onTap: () {},
              isLast: true,
              icon: Roomly.remove,
              color: colors.danger,
              label: Strings.removeAccount.translate),
        ],
      ),
    );
  }
}
