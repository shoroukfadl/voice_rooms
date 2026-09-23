import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/speakers/speaker_avatar.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';

class SpeakersSection extends StatelessWidget {
  const SpeakersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Strings.speakersLabel.translate,
            style: AppTextStyles.fieldLabelText(
                context: context, color: colors.text2)),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 6,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) => SpeakerAvatar(),
        ),
      ],
    );
  }
}
