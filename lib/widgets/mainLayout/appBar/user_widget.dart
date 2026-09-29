import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';

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
          style: AppTextStyles.t14(color: colors.secondary),
        )).paddingOnly(start: mobileHozPadding);
  }
}
