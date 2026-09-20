import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';

class RoomParticipantsPreview extends StatelessWidget {
  const RoomParticipantsPreview({
    super.key,
    required this.totalCount,
    this.avatarUrls = const [],
    this.maxAvatarsShown = 3,
    this.avatarSize = 22,
    this.overlap = 8,
    this.label,
    this.textStyle,
  });

  /// Total number of people in the room (shown next to the avatars).
  final int totalCount;

  /// Avatar image URLs, in the order they should be stacked.
  /// Only the first [maxAvatarsShown] are rendered.
  final List<String> avatarUrls;

  final int maxAvatarsShown;
  final double avatarSize;

  /// How much each avatar overlaps the previous one, in logical pixels.
  final double overlap;

  /// Defaults to "{count} listening" — pass your own for e.g. "watching".
  final String Function(int count)? label;

  final TextStyle? textStyle;

  static const List<Color> _fallbackColors = [
    Color(0xFFFCE7DF), // live tint
    Color(0xFFEBE8FB), // ai tint
    Color(0xFFE1F3EA), // ok tint
    Color(0xFFEFEFEF),
  ];

  @override
  Widget build(BuildContext context) {
    final shownCount = avatarUrls.isEmpty
        ? (totalCount < maxAvatarsShown ? totalCount : maxAvatarsShown)
        : (avatarUrls.length < maxAvatarsShown
            ? avatarUrls.length
            : maxAvatarsShown);

    final colors = context.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: avatarSize,
          width: shownCount == 0
              ? 0
              : avatarSize + (shownCount - 1) * (avatarSize - overlap),
          child: Stack(
            children: List.generate(shownCount, (index) {
              final hasImage = index < avatarUrls.length;
              return Positioned(
                left: index * (avatarSize - overlap),
                child: Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _fallbackColors[index % _fallbackColors.length],
                    border: Border.all(color: colors.border, width: 2),
                    image: hasImage
                        ? DecorationImage(
                            image: NetworkImage(avatarUrls[index]),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          (label ?? _defaultLabel)(totalCount),
          style: AppTextStyles.cardSubtitleText(
              context: context, color: colors.text2),
        ),
      ],
    );
  }

  String _defaultLabel(int count) => '$count listening';
}
