import 'package:flutter/material.dart';
import 'package:roomly/core/Language/app_styles.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/utilities/roomly.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: colors.accent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(
            Roomly.vedio,
            size: 28,
            color: colors.accentSoft,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          strings.video,
          style: AppTextStyles.t14(color: colors.text2),
        ),
      ],
    );
  }
}
