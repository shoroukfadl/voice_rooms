import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/chatProfile/data/model/chat_member_model.dart';
import 'package:roomly/features/chatProfile/presentation/widget/member_item_widget.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/Utilities/Constants/constants.dart';

class GroupDetailsWidget extends StatelessWidget {
  const GroupDetailsWidget({
    super.key,
    required this.members,
  });

  final List<ChatMember> members;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

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
          ...members.map((member) => MemberItemWidget(member: member)),
        ],
      ),
    );
  }
}
