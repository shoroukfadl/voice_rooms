import 'package:flutter/material.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_button_widget.dart';

class SignInWithApple extends StatelessWidget {
  const SignInWithApple({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget.outLined(
      title: Strings.signInApple.translate,
      titleColor: Colors.black,
      width: double.infinity,
      borderColor: Colors.black,
      onPressed: () async {},
    );
  }
}
