import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';

class ResetLinkButton extends StatelessWidget {
  final Function() onPress;
  const ResetLinkButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      title: Strings.sendResetLinkButton.translate,
      onTap: onPress,
    );
  }
}
