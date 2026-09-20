import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/home/presentation/widget/live_badg.dart';
import 'package:voice_rooms/features/home/presentation/widget/people_widget.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/widgets/interactive_widgets/primary_button_widget.dart';

class ActiveRoomCard extends StatelessWidget {
  const ActiveRoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(cardRadius),
          border: Border.all(color: colors.border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LiveBadg(),
          const SizedBox(height: 8),
          Text(
            'Voice Room 1',
            style: AppTextStyles.cardTitleText(
                context: context, color: colors.text1),
          ),
          const SizedBox(height: 8),
          Text(
            'Talking about state management',
            style: AppTextStyles.cardSubtitleText(
                context: context, color: colors.text2),
          ),
          const SizedBox(height: 16),
          Row(
            spacing: 16,
            children: [
              RoomParticipantsPreview(
                totalCount: 32,
                avatarUrls: [],
              ),
              PrimaryButtonWidget(
                      title: Strings.join.translate, height: 48, onTap: () {})
                  .expand,
            ],
          )
        ],
      ),
    );
  }
}
