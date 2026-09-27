import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/createChat/presentation/widget/contact_avatar.dart';

/// A single contact row: avatar + name + status/subtitle.
/// Used as-is by the plain Contacts list ("Active now"/"Last seen ...")
/// and, with [onTap] + [isSelected], by the New Group picker.
class ContactTile extends StatelessWidget {
  final String name;
  final String statusLabel;
  final bool isOnline;
  final Color avatarColor;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool showStatusDot;

  const ContactTile({
    super.key,
    required this.name,
    required this.statusLabel,
    required this.isOnline,
    required this.avatarColor,
    this.onTap,
    this.isSelected = false,
    this.showStatusDot = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        spacing: 12,
        children: [
          ContactAvatar(
            initials: _initialsOf(name),
            backgroundColor: avatarColor,
            showOnlineDot: showStatusDot && isOnline,
            isSelected: isSelected,
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyles.captionText(
                    context: context, color: colors.text1),
              ),
              Text(
                statusLabel,
                style: AppTextStyles.smallestCaptionText(
                    context: context, color: colors.text2),
              ),
            ],
          ).expand,
        ],
      ),
    );
  }
}

String _initialsOf(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));
  final first = parts.isNotEmpty && parts[0].isNotEmpty ? parts[0][0] : '';
  final second = parts.length > 1 && parts[1].isNotEmpty ? parts[1][0] : '';
  return (first + second).toUpperCase();
}
