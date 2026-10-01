import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/interactive_widgets/segmented_button.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isLast;
  final Function() onTap;
  final Color? color, iconColor;
  const SettingsItem(
      {super.key,
      required this.onTap,
      this.isLast = false,
      required this.icon,
      this.color,
      this.iconColor,
      required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: (color ?? colors.text1).withValues(alpha: 0.1),
              radius: 18,
              child: Icon(icon, size: 16, color: iconColor ?? colors.text1),
            ),
            Text(label,
                    style: AppTextStyles.formAndListText(
                        context: context, color: iconColor ?? colors.text1))
                .expand,
            InkWell(
                onTap: onTap,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: (color ?? colors.secondarySoft),
                  child: Icon(Roomly.arrowRight,
                      size: 16, color: iconColor ?? colors.secondary),
                ))
          ],
        ),
        if (!isLast) const Divider(),
      ],
    );
  }
}

class PreferencesItem extends StatelessWidget {
  final bool isLast;
  final List<PreferencesModel> items;
  final Function() onTap;
  final Color? color;

  const PreferencesItem({
    super.key,
    required this.onTap,
    this.isLast = false,
    required this.items,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppSegmentedButton(
      onChanged: (i) {},
      segments: items,
      selectedIndex: 0,
      buildItem: (item, selected) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          if (item.icon != null)
            Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: selected ? colors.accent : colors.border),
                    color: !selected
                        ? Colors.transparent
                        : (color ?? colors.accent)),
                child: Icon(item.icon,
                    size: 16,
                    color: selected
                        ? colors.accentSoft
                        : (color ?? colors.text2))),
          if (item.label != null)
            Text(item.label!,
                style: AppTextStyles.sT12(
                    color: selected ? colors.accent : (color ?? colors.text2))),
        ],
      ),
      height: 40,
    );
  }
}

class PreferencesModel {
  final String? label;
  final IconData? icon;
  PreferencesModel({this.label, this.icon});
}
