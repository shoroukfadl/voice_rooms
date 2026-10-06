import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/profile/presentation/pages/profile_screen.dart';
import 'package:roomly/features/settings/presentation/widget/settings/settings_item.dart';
import 'package:roomly/utilities/constants/constants.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/interactive_widgets/segmented_button.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

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
              value: 'profile',
              label: tr.profile,
              icon: Roomly.profile,
            ),
            onTap: (_) {
              context.goNamed(ProfileScreen.routeName);
            },
            isLast: true,
          ),
          SettingsItem<String>.Arrow(
            item: SegmentOption(
              value: 'security',
              label: tr.privacy,
              icon: Roomly.secuirty,
            ),
            isLast: true,
            onTap: (_) {},
          ),
        ],
      ),
    );
  }
}
