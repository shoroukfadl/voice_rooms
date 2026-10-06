import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/Language/app_styles.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shorouk Fadl",
          style: AppTextStyles.cardTitleText(
              context: context, color: colors.text1),
        ),
        Text(
          "01154152887",
          style:
              AppTextStyles.captionText(context: context, color: colors.text2),
        ),
      ],
    );
  }
}
