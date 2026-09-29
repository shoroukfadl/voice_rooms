import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/helper/icon_with_background.dart';

class CodeVerificationHeader extends StatelessWidget {
  const CodeVerificationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = context.t;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconWithBackground(
            background: colors.accentSoft,
            iconColor: colors.accent,
            icon: Roomly.verify,
            size: 48),
        const SizedBox(height: 16),
        Text(
          tr.verifyTitle,
          style: AppTextStyles.h22(color: colors.text1),
        ),
        const SizedBox(height: 8),
        Text(
          tr.codeSentTo("01222212121"),
          style: AppTextStyles.b12(color: colors.text2),
        ),
      ],
    );
  }
}
