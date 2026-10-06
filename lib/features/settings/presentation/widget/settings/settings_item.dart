import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/interactive_widgets/segmented_button.dart';

class SettingsItem<T> extends StatelessWidget {
  final SegmentOption<T> item;
  final bool isLast;

  final void Function(T) onTap;

  final Color? color, iconColor;

  final List<SegmentOption<T>>? options;

  final T? value;

  final bool _isArrow;

  const SettingsItem.Arrow({
    super.key,
    required this.onTap,
    required this.item,
    this.isLast = false,
    this.color,
    this.iconColor,
  })  : _isArrow = true,
        value = null,
        options = null;

  const SettingsItem.List({
    super.key,
    required this.onTap,
    required this.item,
    required List<SegmentOption<T>> this.options,
    this.value,
    this.isLast = false,
    this.color,
    this.iconColor,
  }) : _isArrow = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fg = iconColor ?? colors.text1;

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
              child: Icon(item.icon, size: 16, color: fg),
            ),
            Text(item.label, style: AppTextStyles.b12(color: fg)),
            if (_isArrow) ...[
              const Spacer(),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () => onTap(item.value),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: color ?? colors.secondarySoft,
                  child: Icon(
                    Roomly.arrowRight,
                    size: 16,
                    color: iconColor ?? colors.secondary,
                  ),
                ),
              )
            ] else ...[
              16.0.widthBox,
              AnimatedSegmentedButton<T>(
                selected: value ?? item.value,
                onChanged: onTap,
                options: options!,
              ).expand
            ],
          ],
        ),
        if (!isLast) const Divider(),
      ],
    );
  }
}
