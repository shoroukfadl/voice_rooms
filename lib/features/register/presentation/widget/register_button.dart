import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/widgets/interactive_widgets/primary_button_widget.dart';

class RegisterButton extends StatelessWidget {
  final Function() onPress;
  const RegisterButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      title: Strings.createAccountButton.translate,
      onTap: onPress,
    );
  }
}
