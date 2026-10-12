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
        Icon(
          Roomly.vedio,
          size: 100,
          color: colors.accent,
        ),
        const SizedBox(height: 8),
        Text(
          strings.video,
          style: AppTextStyles.t16(color: colors.text2),
        ),
      ],
    );
  }
}
