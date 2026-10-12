import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/chatProfile/data/model/chat_member_model.dart';
import 'package:roomly/utilities/extensions.dart';

class MemberItemWidget extends StatelessWidget {
  const MemberItemWidget({
    super.key,
    required this.member,
  });

  final ChatMember member;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: member.isAdmin
                  ? const Color(0xFF10B981)
                  : const Color(0xFF8B5CF6),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              member.initial,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              member.name,
              style: AppTextStyles.t14(color: colors.text1),
            ),
          ),
          if (member.isAdmin)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: colors.accentSoft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                strings.admin,
                style: AppTextStyles.b12(color: colors.accent),
              ),
            ),
        ],
      ),
    );
  }
}
