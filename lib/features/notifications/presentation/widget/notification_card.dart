import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/widgets/media/rounded_image_widget.dart';

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
        children: [
          RoundedImage(
            borderColor: colors.accent,
            backgroundColor: colors.accentSoft,
            radiusValue: 100,
            width: 64,
            height: 64,
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flutter devs Egypt",
                style: AppTextStyles.notificationBoldFragmentText(
                    context: context, color: colors.text1),
              ),
              Text(
                'Just Want tp leave',
                style: AppTextStyles.notificationBodyText(
                    context: context, color: colors.text2),
              ),
              Text(
                '2 days ago',
                style: AppTextStyles.notificationBodyText(
                    context: context, color: colors.text2),
              ),
            ],
          ).expand
        ],
      ),
    );
  }
}
