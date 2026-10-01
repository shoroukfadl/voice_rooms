import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/profile/presentation/widget/settings/settings_item.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/helper/divider.dart';

class PreferencesCard extends StatelessWidget {
  final double padding;
  const PreferencesCard({super.key, this.padding = mobileHozPadding});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
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
          PreferencesItem(
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
          ),
          HozDivider().paddingSymmetric(vertical: 8),
          PreferencesItem(
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
          ),
        ],
      ),
    );
  }
}
