import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class ActiveRoomControls extends StatelessWidget {
  final bool isSelfMuted;
  final VoidCallback? onRaiseHand, onToggleMute, onLeave;

  const ActiveRoomControls({
    super.key,
    required this.isSelfMuted,
    this.onRaiseHand,
    this.onToggleMute,
    this.onLeave,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: colors.border, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoomControlButton(
            icon: Roomly.roomly,
            label: Strings.raiseHand.translate,
            background: colors.card,
            iconColor: colors.text2,
            border: colors.border,
            size: 42,
            onTap: onRaiseHand,
          ),
          RoomControlButton(
            icon: isSelfMuted ? Roomly.muted : Roomly.mic,
            label:
                isSelfMuted ? Strings.unmute.translate : Strings.mute.translate,
            background: colors.success,
            iconColor: colors.secondarySoft,
            size: 48,
            onTap: onToggleMute,
          ),
          RoomControlButton(
            icon: Roomly.leave,
            label: Strings.leave.translate,
            background: colors.danger,
            iconColor: Colors.white,
            size: 42,
            onTap: onLeave,
          ),
        ],
      ).paddingSymmetric(vertical: 14),
    );
  }
}

class RoomControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color background, iconColor;
  final Color? border;
  final double size;
  final VoidCallback? onTap;

  const RoomControlButton({
    super.key,
    required this.icon,
    required this.label,
    required this.background,
    required this.iconColor,
    required this.size,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 6,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkResponse(
          onTap: onTap,
          radius: size * 0.75,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: background,
              border: border != null
                  ? Border.all(color: border!, width: 0.5)
                  : null,
            ),
            child: Icon(icon, size: size * 0.4, color: iconColor),
          ),
        ),
        Text(label,
            style: AppTextStyles.smallestCaptionText(
                context: context, color: colors.text2)),
      ],
    );
  }
}
