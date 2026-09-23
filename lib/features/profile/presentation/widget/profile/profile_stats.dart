import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';

class ProfileStatsRow extends StatelessWidget {
  final int followers, roomsHosted, following;
  const ProfileStatsRow({
    super.key,
    required this.followers,
    required this.following,
    required this.roomsHosted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 14,
      children: [
        StatPill(
            number: roomsHosted.toString(),
            label: Strings.roomsHostedLabel.translate),
        StatPill(
            number: followers.toString(),
            label: Strings.followersLabel.translate),
        StatPill(
            number: following.toString(),
            label: Strings.followingLabel.translate),
      ],
    );
  }
}

class StatPill extends StatelessWidget {
  final String label, number;
  const StatPill({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(number,
            style: AppTextStyles.statNumberText(
                context: context, color: colors.text1)),
        Text(label,
            style: AppTextStyles.captionText(
                context: context, color: colors.text2)),
      ],
    );
  }
}
