import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/profile/presentation/widget/profile/avatar.dart';
import 'package:roomly/features/profile/presentation/widget/profile/name.dart';
import 'package:roomly/features/profile/presentation/widget/profile/profile_stats.dart';
import 'package:roomly/utilities/constants/constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        spacing: 16,
        children: [
          ProfileAvatar(),
          Name(),
          ProfileStatsRow(
            groups: 10,
            contacts: 50,
          ),
        ],
      ),
    );
  }
}
