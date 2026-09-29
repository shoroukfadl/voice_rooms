import 'package:flutter/material.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';

class CodeVerificationButton extends StatelessWidget {
  final Function() onPress;
  const CodeVerificationButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      title: context.t.verify,
      onTap: onPress,
    );
  }
}
