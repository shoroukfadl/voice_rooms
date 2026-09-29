import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/widgets/interactive_widgets/custom_button_widget.dart';

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
          // context.goNamed(ForgotPasswordScreen.routeName);
        },
        child: Text(
          "Strings.forgotPassword.translate",
          style: AppTextStyles.inlineLinkText(
            context: context,
            color: colors.secondary,
          ),
        ),
      ),
    );
  }
}
