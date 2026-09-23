import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/core/Language/app_styles.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        Text(
          "Shorouk Fadl",
          style: AppTextStyles.cardTitleText(
              context: context, color: colors.text1),
        ),
        Text(
          "Flutter devs Egypt · last 42 min",
          style:
              AppTextStyles.captionText(context: context, color: colors.text2),
        )
      ],
    );
  }
}
