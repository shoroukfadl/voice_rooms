// pubspec.yaml
// dependencies:
//   pinput: ^5.0.0

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({
    super.key,
    required this.length,
    this.controller,
    this.focusNode,
    this.hasError = false,
    this.onChanged,
    this.onCompleted,
    this.autofocus = true,
  });

  final int length;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool hasError;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final defaultPinTheme = PinTheme(
      width: 46,
      height: 52,
      textStyle: AppTextStyles.h3(context: context, color: colors.text1),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.border, width: 1.5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: colors.accent, width: 1.5),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: colors.border, width: 1.5),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: colors.danger, width: 1.5),
      ),
    );

    return Pinput(
      length: length,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      forceErrorState: hasError,
      pinAnimationType: PinAnimationType.fade,
      showCursor: true,
      separatorBuilder: (index) => const SizedBox(width: 8),
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
