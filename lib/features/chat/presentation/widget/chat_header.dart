import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/roomly.dart';

class ChatHeader extends StatelessWidget {
  final String name, subtitle;
  const ChatHeader({super.key, required this.name, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Roomly.arrowLeft,
            size: 18,
            color: colors.text2,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFF6B6D73),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            "SN",
            style: AppTextStyles.captionText(
                context: context, color: Colors.white),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.captionText(
                  context: context, color: colors.text1),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: AppTextStyles.smallestCaptionText(
                  context: context, color: colors.success),
            ),
          ],
        ).expand,
        Icon(
          Roomly.call,
          size: 20,
          color: colors.secondary,
        ).paddingOnly(end: 16),
        Icon(
          Roomly.vedio,
          size: 20,
          color: colors.secondary,
        ).paddingOnly(end: 16),
        Icon(
          Roomly.menu,
          size: 20,
          color: colors.secondary,
        ),
      ],
    ).paddingSymmetric(horizontal: mobileHozPadding, vertical: 12);
  }
}
