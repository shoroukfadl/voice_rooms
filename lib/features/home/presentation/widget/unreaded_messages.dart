import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';

class UnReadedMessages extends StatelessWidget {
  const UnReadedMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CircleAvatar(
      radius: 12,
      backgroundColor: colors.secondary,
      child: Text(
        "5",
        style: AppTextStyles.liveBadgeText(
            context: context, color: colors.secondarySoft),
      ),
    );
  }
}
