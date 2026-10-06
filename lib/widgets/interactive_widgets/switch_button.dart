import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';

class SwitchButton extends StatelessWidget {
  final bool active;
  final Function(bool active) onTap;
  const SwitchButton({super.key, required this.onTap, this.active = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.matchedSize(large: 120, medium: 120, small: 48);
    return GestureDetector(
        onTap: () => onTap(!active),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: size,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cardRadius),
            border: Border.all(color: colors.border, width: 1),
            color: active ? colors.accentSoft : colors.surface,
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: !active ? Alignment.centerLeft : Alignment.centerRight,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: active ? colors.accent : colors.border,
            ),
          ),
        ));
  }
}
