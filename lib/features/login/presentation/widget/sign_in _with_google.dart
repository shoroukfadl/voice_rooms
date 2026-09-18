import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_button_widget.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomButtonWidget.outLined(
      title: 'Sign In with Google',
      titleColor: colors.secondary,
      width: double.infinity,
      borderColor: colors.secondary,
      onPressed: () async {},
    );
  }
}
