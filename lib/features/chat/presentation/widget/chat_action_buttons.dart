import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/utilities/roomly.dart';

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
        spacing: 16,
        children: [
          _ActionButton(
            label: strings.translate,
            icon: Roomly.language,
            colors: colors,
            onTap: onTranslate,
          ),
          _ActionButton(
            label: strings.summarize,
            icon: Roomly.ai,
            colors: colors,
            onTap: onSummarize,
          ),
          _ActionButton(
            label: strings.correct,
            icon: Roomly.check,
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
          height: 40,
          alignment: Alignment.center,
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
                size: 16,
                color: colors.text2,
              ),
              Text(
                label,
                style: AppTextStyles.t12(color: colors.text1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
