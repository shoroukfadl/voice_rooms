import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/roomly.dart';

class AiSummaryCard extends StatelessWidget {
  final String preview;
  final VoidCallback? onTap;
  const AiSummaryCard({super.key, required this.preview, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
            color: colors.secondarySoft,
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 6,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Roomly.explore, size: 16, color: colors.secondary),
                    Text(Strings.aiSummaryToggleTitle.translate,
                        style: AppTextStyles.boldInlineText(
                            context: context, color: colors.secondary)),
                  ],
                ),
                Icon(Icons.chevron_right, size: 16, color: colors.secondary),
              ],
            ),
            Text(preview,
                style: AppTextStyles.cardSubtitleText(
                    context: context, color: colors.text1)),
          ],
        ).paddingAll(padding: mobileHozPadding),
      ),
    );
  }
}
