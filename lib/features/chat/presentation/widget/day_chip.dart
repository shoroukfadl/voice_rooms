import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';

class DayChip extends StatelessWidget {
  const DayChip({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          style: AppTextStyles.smallestCaptionText(
              context: context, color: colors.text3),
        ),
      ),
    );
  }
}
