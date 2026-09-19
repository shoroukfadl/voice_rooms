import 'package:flutter/cupertino.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/roomly.dart';
import 'package:voice_rooms/widgets/helper/icon_with_background.dart';

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
          style: AppTextStyles.h1(context: context, color: colors.text1),
        ),
        const SizedBox(height: 8),
        Text(
          Strings.forgotPasswordSubtitle.translate,
          style: AppTextStyles.h2(context: context, color: colors.text2),
        ),
      ],
    );
  }
}
