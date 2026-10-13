import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';

class LoginHeader extends StatelessWidget {
  final double imageSize;
  const LoginHeader({super.key, this.imageSize = 320});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = context.t;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tr.loginTitle,
          style: AppTextStyles.h22(color: colors.text1),
        ),
        const CustomSpacer.S(),
        Text(
          tr.loginSubtitle,
          style: AppTextStyles.b12(color: colors.text2),
        ),
      ],
    );
  }
}
