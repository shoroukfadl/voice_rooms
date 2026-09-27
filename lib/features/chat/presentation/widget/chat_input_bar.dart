import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/roomly.dart';

class ChatInputBar extends StatelessWidget {
  const ChatInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colors.card,
        border: Border(top: BorderSide(color: colors.border, width: 0.5)),
      ),
      child: Row(
        children: [
          Icon(
            Roomly.add,
            size: 20,
            color: colors.text3,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: colors.card,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                Strings.messageInputPlaceholder.translate,
                style: AppTextStyles.flowScreenTitle(
                    context: context, color: colors.text3),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colors.text1,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.send_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
