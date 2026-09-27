import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/helper/icon_with_background.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconWithBackground(
            background: colors.accentSoft,
            iconColor: colors.accent,
            icon: Roomly.forgot,
            size: 48),
        const SizedBox(height: 16),
        Text(
          Strings.forgotPasswordTitle.translate,
          style: AppTextStyles.flowScreenTitle(
              context: context, color: colors.text1),
        ),
        const SizedBox(height: 8),
        Text(
          Strings.forgotPasswordSubtitle.translate,
          style: AppTextStyles.screenSubtitleText(
              context: context, color: colors.text2),
        ),
      ],
    );
  }
}
