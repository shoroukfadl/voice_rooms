import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/chat/data/model/chat_model.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/utilities/roomly.dart';

class ChatProfileScreen extends StatelessWidget {
  const ChatProfileScreen({
    super.key,
    required this.chatType,
    this.name,
    this.phoneNumber,
    this.about,
    this.language,
    this.mediaCount,
    this.isMuted,
    this.members,
  });

  final ChatType chatType;
  final String? name;
  final String? phoneNumber;
  final String? about;
  final String? language;
  final int? mediaCount;
  final bool? isMuted;
  final List<ChatMember>? members;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return Scaffold(
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Avatar
            _buildAvatar(colors),
            const SizedBox(height: 16),
            // Name
            if (name != null)
              Text(
                name!,
                style: AppTextStyles.h20(color: colors.text1),
              ),
            const SizedBox(height: 8),
            // Subtitle (phone number or member count)
            if (chatType == ChatType.direct && phoneNumber != null)
              Text(
                phoneNumber!,
                style: AppTextStyles.t14(color: colors.text2),
              )
            else if (chatType == ChatType.group && members != null)
              Text(
                strings.groupMembers(members!.length),
                style: AppTextStyles.t14(color: colors.text2),
              ),
            const SizedBox(height: 24),
            // Video Call Button
            _buildVideoCallButton(colors, strings),
            const SizedBox(height: 32),
            // Details Section
            if (chatType == ChatType.direct)
              _buildIndividualDetails(colors, strings)
            else
              _buildGroupDetails(colors, strings),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(dynamic colors) {
    String initial = name?.isNotEmpty == true ? name![0].toUpperCase() : '?';

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: chatType == ChatType.group
            ? const Color(0xFFD4A574)
            : const Color(0xFF8B5CF6),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildVideoCallButton(dynamic colors, AppLocalizations strings) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: colors.accent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(
            Roomly.vedio,
            size: 28,
            color: colors.accentSoft,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          strings.video,
          style: AppTextStyles.t14(color: colors.text2),
        ),
      ],
    );
  }

  Widget _buildIndividualDetails(dynamic colors, AppLocalizations strings) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mobileHozPadding),
      child: Column(
        children: [
          _buildDetailRow(
            colors: colors,
            label: strings.about,
            value: about ?? 'Product manager',
          ),
          _buildDetailRow(
            colors: colors,
            label: strings.language,
            value: language ?? 'English',
          ),
          _buildDetailRow(
            colors: colors,
            label: strings.mediaAndFiles,
            value: '${mediaCount ?? 24} >',
          ),
          _buildDetailRow(
            colors: colors,
            label: strings.muteNotifications,
            value: isMuted == true ? strings.yes : strings.no,
          ),
        ],
      ),
    );
  }

  Widget _buildGroupDetails(dynamic colors, AppLocalizations strings) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mobileHozPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.members,
            style: AppTextStyles.t14(color: colors.text2),
          ),
          const SizedBox(height: 16),
          if (members != null)
            ...members!
                .map((member) => _buildMemberItem(colors, strings, member)),
        ],
      ),
    );
  }

  Widget _buildMemberItem(
      dynamic colors, AppLocalizations strings, ChatMember member) {
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
              style: TextStyle(
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
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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

  Widget _buildDetailRow({
    required dynamic colors,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyles.t14(color: colors.text2),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.t14(color: colors.text1),
          ),
        ],
      ),
    );
  }
}

class ChatMember {
  final String name;
  final String initial;
  final bool isAdmin;

  ChatMember({
    required this.name,
    required this.initial,
    this.isAdmin = false,
  });
}
