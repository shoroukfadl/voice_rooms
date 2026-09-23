import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';

class KeyPoints extends StatelessWidget {
  const KeyPoints({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: colors.secondarySoft,
          borderRadius: BorderRadius.circular(cardRadius)),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.keyPointsLabel.translate,
              style: AppTextStyles.fieldLabelText(
                  context: context, color: colors.secondary)),
          Text(
              "The group compared Riverpod and Bloc for mid-size apps, leaning toward Riverpod for less boilerplate. Salma shared a testing pattern for async notifiers.",
              style: AppTextStyles.cardSubtitleText(
                  context: context, color: colors.text1)),
        ],
      ),
    );
  }
}
