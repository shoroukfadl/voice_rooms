import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/home/presentation/widget/unreaded_messages.dart';
import 'package:voice_rooms/widgets/media/rounded_image_widget.dart';

class ChatCard extends StatelessWidget {
  final bool isLast;
  const ChatCard({super.key, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
        margin: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cardRadius),
            border: isLast
                ? null
                : Border(
                    bottom: BorderSide(color: colors.border),
                  )),
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedImage(
              width: 64,
              height: 64,
              imagePath: '',
              radiusValue: 100,
              backgroundColor: colors.accentSoft,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    Text(
                      'Voice Room 1',
                      style: AppTextStyles.cardTitleText(
                          context: context, color: colors.text1),
                    ).expand,
                    Text(
                      '02:24 PM',
                      style: AppTextStyles.chipText(
                          context: context, color: colors.text3),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  spacing: 16,
                  children: [
                    Text(
                      'Talking about state management',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cardSubtitleText(
                          context: context, color: colors.text2),
                    ).expand,
                    UnReadedMessages()
                  ],
                ),
              ],
            ).expand,
          ],
        ));
  }
}
