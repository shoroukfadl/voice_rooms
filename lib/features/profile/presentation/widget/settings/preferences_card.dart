import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/profile/presentation/widget/settings/settings_item.dart';
import 'package:voice_rooms/utilities/constants/constants.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class PreferencesCard extends StatelessWidget {
  const PreferencesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      children: [
        Container(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
          margin: EdgeInsetsDirectional.only(start: mobileHozPadding),
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(cardRadius),
            border: Border.all(color: colors.border),
          ),
          child: PreferencesItem(
              onTap: () {},
              items: [
                PreferencesModel(
                  icon: Roomly.dark,
                ),
                PreferencesModel(
                  icon: Roomly.light,
                ),
                PreferencesModel(
                  icon: Roomly.system,
                ),
              ],
              label: Strings.theme.translate),
        ).expand,
        Container(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
          margin: EdgeInsetsDirectional.only(end: mobileHozPadding),
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(cardRadius),
            border: Border.all(color: colors.border),
          ),
          child: PreferencesItem(
              onTap: () {},
              isLast: true,
              items: [
                PreferencesModel(
                  label: "English",
                ),
                PreferencesModel(
                  label: "العربيه",
                ),
              ],
              label: Strings.language.translate),
        ).expand,
      ],
    );
  }
}
