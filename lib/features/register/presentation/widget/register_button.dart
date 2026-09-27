import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';

class RegisterButton extends StatelessWidget {
  final Function() onPress;
  final bool isLoading;
  const RegisterButton(
      {super.key, required this.onPress, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      title: Strings.createAccountButton.translate,
      onTap: onPress,
      loading: isLoading,
    );
  }
}
