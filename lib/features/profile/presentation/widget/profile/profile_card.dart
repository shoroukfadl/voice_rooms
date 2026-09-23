import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/profile/presentation/widget/profile/avatar.dart';
import 'package:voice_rooms/features/profile/presentation/widget/profile/name.dart';
import 'package:voice_rooms/features/profile/presentation/widget/profile/profile_stats.dart';
import 'package:voice_rooms/utilities/constants/constants.dart';

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
          ProfileStatsRow(followers: 10, following: 50, roomsHosted: 2),
        ],
      ),
    );
  }
}
