import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/extensions.dart';

class ResendEmailWidget extends StatelessWidget {
  const ResendEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.didntGetItText.translate,
          style:
              AppTextStyles.captionText(context: context, color: colors.text2),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            Strings.resendEmailLink.translate,
            style: AppTextStyles.inlineLinkText(
                    context: context, color: colors.secondary)
                .copyWith(
              decoration: TextDecoration.underline,
              decorationColor: colors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
