import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';

class ResendEmailVerificationWidget extends StatelessWidget {
  const ResendEmailVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Strings.didntGetItText.translate",
          style:
              AppTextStyles.captionText(context: context, color: colors.text2),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "Strings.resendEmailLink.translate",
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
