import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class AiSummaryHeader extends StatelessWidget {
  const AiSummaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          spacing: 8,
          children: [
            Text(
              Strings.aiSummaryToggleTitle.translate,
              style: AppTextStyles.screenTitle(
                  context: context, color: colors.text1),
            ).expand,
            IconButton(
              icon: Icon(
                Roomly.share,
                size: 28,
                color: colors.accent,
              ),
              onPressed: () {},
            )
          ],
        ),
        Text(
          "Flutter devs Egypt · last 42 min",
          style:
              AppTextStyles.captionText(context: context, color: colors.text2),
        )
      ],
    ).paddingSymmetric(horizontal: mobileHozPadding);
  }
}
