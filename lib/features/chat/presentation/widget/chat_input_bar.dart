import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/interactive_widgets/custom_text_field.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({
    super.key,
    this.suggestedMessage,
    this.onSuggestionTap,
  });

  final String? suggestedMessage;
  final VoidCallback? onSuggestionTap;

  _ChatInputBarState createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  TextEditingController message = TextEditingController();
  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return Column(
      children: [
        // Suggested Message
        if (widget.suggestedMessage != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mobileHozPadding),
            child: Row(
              children: [
                Text(
                  strings.suggestion,
                  style: AppTextStyles.t14(color: colors.text2),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: widget.onSuggestionTap,
                    borderRadius: BorderRadius.circular(cardRadius),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: colors.accent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(cardRadius),
                      ),
                      child: Text(
                        widget.suggestedMessage!,
                        style: AppTextStyles.t14(color: colors.accent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 8),
        // Input Field
        CustomTextField(
          controller: message,
          hint: strings.typeMessage,
          keyboardType: TextInputType.multiline,
          prefixIcon: Roomly.add,
          borderRadius: 0,
          suffixIcon: Container(
            width: 40,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: colors.accent,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(Roomly.send, size: 20, color: colors.accentSoft),
          ),
        ),
      ],
    );
  }
}
