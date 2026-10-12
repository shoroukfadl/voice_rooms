import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/utilities/roomly.dart';

class NewChatWidgetBottomSheet extends StatelessWidget {
  const NewChatWidgetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOption(
            context,
            icon: Roomly.chats,
            title: strings.newChat,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 16),
          _buildOption(
            context,
            icon: Roomly.contact,
            title: strings.newGroup,
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to new group screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: colors.accentSoft,
            child: Icon(
              icon,
              color: colors.accent,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Text(title, style: AppTextStyles.t16(color: colors.text1)),
          const Spacer(),
          Icon(
            Roomly.arrowLeft,
            color: colors.text2,
            size: 24,
          ),
        ],
      ),
    );
  }
}
