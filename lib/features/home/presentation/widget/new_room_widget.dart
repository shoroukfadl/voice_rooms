import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_button_widget.dart';

class NewRoomCard extends StatelessWidget {
  const NewRoomCard({super.key});

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
        children: [
          Text(
            Strings.homeEmptyStateText.translate,
            style: AppTextStyles.cardSubtitleText(
                context: context, color: colors.text2),
          ),
          const SizedBox(height: 16),
          CustomButtonWidget(
            title: Strings.newRoomButton.translate,
            onPressed: () {},
            height: 48,
            btnColor: colors.background,
            borderColor: colors.border,
          )
        ],
      ),
    );
  }
}
