import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';

class ChatMessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isIncoming;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isIncoming,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment:
          isIncoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isIncoming ? colors.surface : colors.text1,
            border: isIncoming
                ? Border.all(color: colors.border, width: 0.5)
                : null,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(14),
              topRight: const Radius.circular(14),
              bottomLeft: Radius.circular(isIncoming ? 4 : 14),
              bottomRight: Radius.circular(isIncoming ? 14 : 4),
            ),
          ),
          child: Text(
            message,
            style: AppTextStyles.flowScreenTitle(
              context: context,
              color: isIncoming ? colors.text1 : Colors.white,
            ),
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
