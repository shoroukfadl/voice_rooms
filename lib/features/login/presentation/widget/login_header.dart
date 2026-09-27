import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';

class LoginHeader extends StatelessWidget {
  final double imageSize;
  const LoginHeader({super.key, this.imageSize = 320});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text(
          Strings.loginTitle.translate,
          style: AppTextStyles.flowScreenTitle(
              context: context, color: colors.text1),
        ),
        const SizedBox(height: 8),
        Text(
          Strings.loginSubtitle.translate,
          style: AppTextStyles.screenSubtitleText(
              context: context, color: colors.text2),
        ),
      ],
    );
  }
}
