import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_button_widget.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomButtonWidget(
      title: Strings.signInWithGoogle.translate,
      titleColor: colors.text1,
      width: double.infinity,
      btnColor: colors.card,
      borderColor: colors.border,
      onPressed: () async {},
    );
  }
}
