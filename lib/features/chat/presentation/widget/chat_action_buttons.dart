import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';

class ChatActionButtons extends StatelessWidget {
  const ChatActionButtons({
    super.key,
    this.onTranslate,
    this.onSummarize,
    this.onCorrect,
  });

  final VoidCallback? onTranslate;
  final VoidCallback? onSummarize;
  final VoidCallback? onCorrect;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: mobileHozPadding, vertical: 12),
      child: Row(
        spacing: 4,
        children: [
          _ActionButton(
            label: strings.translate,
            icon: Icons.translate,
            colors: colors,
            onTap: onTranslate,
          ),
          _ActionButton(
            label: strings.summarize,
            icon: Icons.summarize,
            colors: colors,
            onTap: onSummarize,
          ),
          _ActionButton(
            label: strings.correct,
            icon: Icons.check_circle,
            colors: colors,
            onTap: onCorrect,
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.colors,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final dynamic colors;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(cardRadius),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(cardRadius),
            border: Border.all(color: colors.border, width: 0.5),
          ),
          child: Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: colors.text2,
              ),
              Text(
                label,
                style: AppTextStyles.t14(color: colors.text1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
