import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/speakers/mic_widget.dart';

class SpeakerAvatar extends StatelessWidget {
  const SpeakerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 54,
          height: 54,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.surface,
                  border:
                      true ? Border.all(color: colors.accent, width: 2) : null,
                  // image: speaker.avatarUrl != null
                  //     ? DecorationImage(
                  //         image: NetworkImage(speaker.avatarUrl!),
                  //         fit: BoxFit.cover)
                  //     : null,
                ),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: MicStatusDot(isMuted: false),
              ),
            ],
          ),
        ),
        Text(
          'Shorouk Fadl',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.cardTitleText(
            context: context,
            color: true ? colors.text1 : colors.text2,
          ),
        ),
        Text(
          false ? 'Muted' : (true ? 'Host' : 'Speaker'),
          style: AppTextStyles.smallestCaptionText(
            context: context,
            color: true ? colors.accent : colors.text3,
          ),
        ),
      ],
    );
  }
}
