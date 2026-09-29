import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/utilities/extensions.dart';

class LanguageButtonWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageButtonWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? colors.accent : colors.card,
          borderRadius: BorderRadius.circular(fieldsRadius),
          border: Border.all(
            color: isSelected ? colors.accent : colors.border,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.t16(
              color: isSelected ? Colors.white : colors.text1,
            ),
          ),
        ),
      ),
    );
  }
}
