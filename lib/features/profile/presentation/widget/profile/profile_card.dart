import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/profile/presentation/widget/profile/avatar.dart';
import 'package:roomly/features/profile/presentation/widget/profile/edit_profile_button.dart';
import 'package:roomly/features/profile/presentation/widget/profile/name.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(
          horizontal: mobileHozPadding, vertical: 16),
      color: colors.card,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              ProfileAvatar(),
              Name().expand,
              EditProfileButton(),
            ],
          ),
          Text(
            "sfijeivfiooewrj ogrie",
            style: AppTextStyles.captionText(
                context: context, color: colors.text2),
          ),
        ],
      ),
    );
  }
}
