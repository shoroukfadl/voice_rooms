import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';

class NotificationCard extends StatelessWidget {
  final bool isLast;
  const NotificationCard({super.key, this.isLast = false});

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
          CircleAvatar(
            radius: 6,
            backgroundColor: true ? colors.accent : colors.secondary,
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flutter devs Egypt",
                style: AppTextStyles.sT12(color: colors.text1),
              ),
              Text(
                'Just Want tp leave',
                style: AppTextStyles.sT10(color: colors.text2),
              ),
            ],
          ).expand,
          Text(
            '2 days ago',
            style: AppTextStyles.sT10(color: colors.text2),
          ),
        ],
      ),
    );
  }
}
