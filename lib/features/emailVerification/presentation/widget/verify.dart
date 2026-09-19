import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/widgets/interactive_widgets/primary_button_widget.dart';

class EmailVerificationButton extends StatelessWidget {
  final Function() onPress;
  const EmailVerificationButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      title: Strings.verifyEmailButton.translate,
      onTap: onPress,
    );
  }
}
