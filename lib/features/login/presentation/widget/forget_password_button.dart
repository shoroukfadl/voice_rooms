import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/forgotPassword/presentation/pages/forgot_password_screen.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_button_widget.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Align(
      alignment: Alignment.centerRight,
      child: CustomButtonWidget.outLined(
        borderColor: Colors.transparent,
        width: 140,
        onPressed: () {
          context.goNamed(ForgotPasswordScreen.routeName);
        },
        child: Text(
          Strings.forgotPassword.translate,
          style: AppTextStyles.l1(
            context: context,
            color: colors.secondary,
          ),
        ),
      ),
    );
  }
}
