import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class RoomStatsRow extends StatelessWidget {
  final int liveMinutes, listenersCount, speakingCount;
  const RoomStatsRow({
    super.key,
    required this.liveMinutes,
    required this.listenersCount,
    required this.speakingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14,
      children: [
        RoomStatPill(
            icon: Roomly.headPhone,
            label: '$listenersCount ${Strings.listenersLabel.translate}'),
        RoomStatPill(
            icon: Roomly.mic,
            label: '$speakingCount ${Strings.speakersLabel.translate}'),
      ],
    );
  }
}

class RoomStatPill extends StatelessWidget {
  final IconData icon;
  final String label;
  const RoomStatPill({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: colors.text2),
        Text(label,
            style: AppTextStyles.captionText(
                context: context, color: colors.text2)),
      ],
    );
  }
}
