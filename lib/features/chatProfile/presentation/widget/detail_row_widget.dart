import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/utilities/extensions.dart';

class DetailRowWidget extends StatelessWidget {
  const DetailRowWidget({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyles.t14(color: colors.text2),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.t14(color: colors.text1),
          ),
        ],
      ),
    );
  }
}
