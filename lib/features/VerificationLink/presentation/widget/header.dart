import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/helper/icon_with_background.dart';

class EmailLinkHeader extends StatelessWidget {
  const EmailLinkHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        IconWithBackground(
            background: colors.accentSoft,
            iconColor: colors.accent,
            icon: Roomly.emailVerification,
            size: 48),
        const SizedBox(height: 24),
        Text(
          Strings.verifyEmailTitle.translate,
          style: AppTextStyles.flowScreenTitle(
              context: context, color: colors.text1),
        ),
        const SizedBox(height: 8),
        Text(
          Strings.emailVerificationLink.translate,
          style: AppTextStyles.screenSubtitleText(
              context: context, color: colors.text2),
        ),
      ],
    );
  }
}
