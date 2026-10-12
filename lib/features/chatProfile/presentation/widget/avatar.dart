import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/features/chat/data/model/chat_model.dart';
import 'package:roomly/utilities/extensions.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.chatType,
    this.name,
  });

  final ChatType chatType;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    String initial = name?.isNotEmpty == true ? name![0].toUpperCase() : '?';

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: chatType == ChatType.group ? colors.accent : colors.secondary,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: AppTextStyles.h18(color: context.colors.text1),
      ),
    );
  }
}
