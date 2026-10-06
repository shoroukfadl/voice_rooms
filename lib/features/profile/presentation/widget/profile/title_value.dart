import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/widgets/helper/divider.dart';

class TitleValue extends StatelessWidget {
  final String title, value;
  final bool isLast;
  const TitleValue(
      {super.key,
      required this.title,
      this.isLast = false,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 8,
          children: [
            Text(
              title,
              style: AppTextStyles.t14(color: context.colors.text1),
            ).expand,
            Text(
              value,
              style: AppTextStyles.b12(color: context.colors.text2),
            ),
          ],
        ),
        if (!isLast) HozDivider(),
      ],
    ).paddingSymmetric(horizontal: mobileHozPadding);
  }
}
