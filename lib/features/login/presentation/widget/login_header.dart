import 'package:flutter/cupertino.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/roomly.dart';
import 'package:voice_rooms/widgets/helper/icon_with_background.dart';

class LoginHeader extends StatelessWidget {
  final double imageSize;
  const LoginHeader({super.key, this.imageSize = 320});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconWithBackground(
            background: colors.accentSoft,
            iconColor: colors.accent,
            icon: Roomly.login,
            size: 48),
        const SizedBox(height: 16),
        Text(
          Strings.loginTitle.translate,
          style: AppTextStyles.h1(context: context, color: colors.text1),
        ),
        const SizedBox(height: 8),
        Text(
          Strings.loginSubtitle.translate,
          style: AppTextStyles.h2(context: context, color: colors.text2),
        ),
      ],
    );
  }
}
