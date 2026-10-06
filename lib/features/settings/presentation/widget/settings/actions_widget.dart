import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/settings/presentation/widget/settings/settings_item.dart';
import 'package:roomly/utilities/constants/constants.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/interactive_widgets/segmented_button.dart';

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
          SettingsItem<String>.Arrow(
            item: SegmentOption(
              value: 'logout',
              label: tr.logOut,
              icon: Roomly.logout,
            ),
            onTap: (_) {},
          ),
          SettingsItem<String>.Arrow(
            item: SegmentOption(
              value: 'delete',
              label: tr.deleteAccount,
              icon: Roomly.remove,
            ),
            onTap: (_) {},
            isLast: true,
            color: colors.danger.withValues(alpha: 0.1),
            iconColor: colors.danger,
          ),
        ],
      ),
    );
  }
}
