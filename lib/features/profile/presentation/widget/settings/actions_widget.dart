import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/profile/presentation/widget/settings/settings_item.dart';
import 'package:roomly/utilities/constants/constants.dart';
import 'package:roomly/utilities/roomly.dart';

class ActionsCard extends StatelessWidget {
  const ActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = context.t;
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
          SettingsItem(onTap: () {}, icon: Roomly.logout, label: tr.logOut),
          SettingsItem(
              onTap: () {},
              isLast: true,
              icon: Roomly.remove,
              color: colors.danger.withValues(alpha: 0.1),
              iconColor: colors.danger,
              label: tr.deleteAccount),
        ],
      ),
    );
  }
}
