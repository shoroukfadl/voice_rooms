import 'package:flutter/material.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/interactive_widgets/custom_button_widget.dart';

class SignInWithApple extends StatelessWidget {
  const SignInWithApple({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomButtonWidget(
      title: Strings.signInApple.translate,
      titleColor: colors.text1,
      width: double.infinity,
      btnColor: colors.surface,
      borderColor: colors.border,
      onPressed: () async {},
    );
  }
}
