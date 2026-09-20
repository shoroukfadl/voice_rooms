import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';

class LiveBadg extends StatelessWidget {
  const LiveBadg({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 4,
      children: [
        CircleAvatar(
          radius: 4,
          backgroundColor: colors.accent,
        ),
        Text(
          Strings.live.translate,
          style: AppTextStyles.liveBadgeText(
              context: context, color: colors.accent),
        ),
      ],
    );
  }
}
