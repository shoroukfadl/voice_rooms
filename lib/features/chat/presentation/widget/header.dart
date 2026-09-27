import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/widgets/media/rounded_image_widget.dart';

class ChatHeader extends StatelessWidget {
  final String roomName, subtitle;
  const ChatHeader({super.key, required this.roomName, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedImage(
          width: 48,
          height: 48,
          imagePath: '',
          radiusValue: 100,
          backgroundColor: colors.accentSoft,
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roomName,
              style: AppTextStyles.captionText(
                  context: context, color: colors.text1),
            ),
            Text(
              subtitle,
              style: AppTextStyles.smallestCaptionText(
                  context: context, color: colors.text2),
            )
          ],
        ).expand
      ],
    ).paddingSymmetric(horizontal: mobileHozPadding);
  }
}
