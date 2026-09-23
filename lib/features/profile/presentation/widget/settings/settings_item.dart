import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/widgets/interactive_widgets/segmented_button.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isLast;
  final Function() onTap;
  final Color? color;
  const SettingsItem(
      {super.key,
      required this.onTap,
      this.isLast = false,
      required this.icon,
      this.color,
      required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: (color ?? colors.text1).withValues(alpha: 0.1),
                radius: 18,
                child: Icon(icon, size: 16, color: color ?? colors.text1),
              ),
              Text(label,
                  style: AppTextStyles.formAndListText(
                      context: context, color: color ?? colors.text1)),
            ],
          ),
        ),
        if (!isLast) const Divider(),
      ],
    );
  }
}

class PreferencesItem extends StatelessWidget {
  final String label;
  final bool isLast;
  final List<PreferencesModel> items;
  final Function() onTap;
  final Color? color;

  const PreferencesItem(
      {super.key,
      required this.onTap,
      this.isLast = false,
      required this.items,
      this.color,
      required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTextStyles.formAndListText(
                context: context, color: color ?? colors.text1)),
        AppSegmentedButton(
          onChanged: (i) {},
          segments: items,
          selectedIndex: 0,
          buildItem: (item, selected) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              if (item.icon != null)
                Icon(item.icon,
                    size: 16,
                    color: selected ? Colors.white : (color ?? colors.text1)),
              if (item.label != null)
                Text(item.label!,
                    style: AppTextStyles.formAndListText(
                        context: context,
                        color:
                            selected ? Colors.white : (color ?? colors.text1))),
            ],
          ),
          height: 32,
        ),
      ],
    );
  }
}

class PreferencesModel {
  final String? label;
  final IconData? icon;
  PreferencesModel({this.label, this.icon});
}
