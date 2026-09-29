import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/login/presentation/pages/login_screen.dart';
import 'package:roomly/widgets/interactive_widgets/custom_button_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomButtonWidget(
      title: "Strings.backToLogInButton.translate",
      onPressed: () {
        context.goNamed(LoginScreen.routeName);
      },
      height: 48,
      btnColor: colors.surface,
      borderColor: colors.border,
    ).paddingOnly(bottom: 40, start: mobileHozPadding, end: mobileHozPadding);
  }
}
