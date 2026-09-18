import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/features/register/presentation/pages/register_screen.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/extensions.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.dontHaveAccount.translate,
          style: AppTextStyles.h4(context: context, color: colors.secondary),
        ),
        InkWell(
          onTap: () {
            context.goNamed(RegisterScreen.routeName);
          },
          child: Text(
            Strings.createAccountButton.translate,
            style: AppTextStyles.h5(context: context, color: colors.text1)
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
