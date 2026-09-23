import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';

class ListenersSection extends StatelessWidget {
  final int listenersCount;
  const ListenersSection({
    super.key,
    required this.listenersCount,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const maxShown = 6;
    // final shown = avatarUrls.take(maxShown).toList();
    final remaining = listenersCount /*- shown.length*/;

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.listenersLabel.translate,
                style: AppTextStyles.fieldLabelText(
                    context: context, color: colors.text2)),
            Text('$listenersCount ${Strings.topicTagsLabel.translate}',
                style: AppTextStyles.smallestCaptionText(
                    context: context, color: colors.text3)),
          ],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            // for (final url in shown)
            //   CircleAvatar(
            //       radius: 14,
            //       backgroundColor: colors.card,
            //       backgroundImage: NetworkImage(url)),
            if (remaining > 0)
              CircleAvatar(
                radius: 14,
                backgroundColor: colors.card,
                child: Text('+$remaining',
                    style: AppTextStyles.smallestCaptionText(
                        context: context, color: colors.text2)),
              ),
          ],
        ),
      ],
    );
  }
}
