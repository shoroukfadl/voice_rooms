import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/features/login/presentation/pages/login_screen.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/extensions.dart';

class GoToLogin extends StatelessWidget {
  const GoToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.rememberedPasswordText.translate,
          style:
              AppTextStyles.captionText(context: context, color: colors.text2),
        ),
        InkWell(
          onTap: () {
            context.goNamed(LoginScreen.routeName);
          },
          child: Text(
            Strings.login.translate,
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
