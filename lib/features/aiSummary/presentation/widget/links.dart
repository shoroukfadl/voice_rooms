import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';

class MentionedLinks extends StatelessWidget {
  const MentionedLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          Strings.topicsCoveredLabel.translate,
          style: AppTextStyles.fieldLabelText(
              context: context, color: context.colors.text2),
        ),
        ...List.generate(
            3,
            (index) => Text(
                  'Link $index',
                  style: AppTextStyles.inlineLinkText(
                      context: context, color: context.colors.text3),
                )),
      ],
    );
  }
}
