import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/features/login/presentation/pages/login_screen.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/extensions.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.haveAccount.translate,
          style: AppTextStyles.captionText(
              context: context, color: colors.secondary),
        ),
        InkWell(
          onTap: () {
            context.goNamed(LoginScreen.routeName);
          },
          child: Text(
            Strings.login.translate,
            style: AppTextStyles.inlineLinkText(
                    context: context, color: colors.text1)
                .copyWith(
              decoration: TextDecoration.underline,
              decorationColor: colors.text1,
            ),
          ),
        ),
      ],
    );
  }
}
