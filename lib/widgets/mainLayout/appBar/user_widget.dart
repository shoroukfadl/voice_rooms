import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CircleAvatar(
        radius: 26,
        backgroundColor: colors.secondarySoft,
        child: Text(
          'SF',
          style: AppTextStyles.largeDisplayHeadline(
              context: context, color: colors.secondary),
        )).paddingOnly(start: mobileHozPadding);
  }
}
