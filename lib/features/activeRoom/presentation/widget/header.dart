import 'package:flutter/cupertino.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';

class ActiveRoomHeader extends StatelessWidget {
  final String roomName, subtitle;
  const ActiveRoomHeader(
      {super.key, required this.roomName, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          roomName,
          style:
              AppTextStyles.screenTitle(context: context, color: colors.text1),
        ),
        Text(
          subtitle,
          style: AppTextStyles.screenSubtitleText(
              context: context, color: colors.text2),
        )
      ],
    ).paddingSymmetric(horizontal: mobileHozPadding);
  }
}
