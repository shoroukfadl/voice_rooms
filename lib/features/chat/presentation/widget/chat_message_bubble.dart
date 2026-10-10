import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';

class ChatMessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isIncoming;
  final String? translatedFrom;
  final String? translatedMessage;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isIncoming,
    this.translatedFrom,
    this.translatedMessage,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return Column(
      crossAxisAlignment:
          isIncoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.70,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isIncoming ? colors.surface : colors.accentSoft,
            border: isIncoming
                ? Border.all(color: colors.border, width: 0.5)
                : null,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(cardRadius),
              topRight: const Radius.circular(cardRadius),
              bottomLeft: Radius.circular(isIncoming ? 4 : cardRadius),
              bottomRight: Radius.circular(isIncoming ? cardRadius : 4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: AppTextStyles.cardSubtitleText(
                  context: context,
                  color: isIncoming ? colors.text1 : colors.accent,
                ),
              ),
              if (translatedMessage != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colors.accent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (translatedFrom != null)
                        Text(
                          strings.translatedFrom(translatedFrom!),
                          style: AppTextStyles.b10(color: colors.accent),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        translatedMessage!,
                        style: AppTextStyles.cardSubtitleText(
                          context: context,
                          color: colors.text1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 3),
        Text(
          time,
          style: AppTextStyles.smallestCaptionText(
              context: context, color: colors.text3),
        ),
      ],
    ).paddingSymmetric(vertical: 4);
  }
}
