import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';

/// e.g. "Online now" / "All contacts"
class ContactsSectionHeader extends StatelessWidget {
  final String label;

  const ContactsSectionHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      label,
      style: AppTextStyles.smallestCaptionText(
          context: context, color: colors.text2),
    );
  }
}
