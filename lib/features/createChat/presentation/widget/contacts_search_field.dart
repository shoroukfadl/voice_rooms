import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';

/// Rounded "Search contacts" field, shared by both screens.
class ContactsSearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ContactsSearchField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerLeft,
      child: CupertinoTextField(
        onChanged: onChanged,
        placeholder: 'Search contacts',
        placeholderStyle: AppTextStyles.smallestCaptionText(
            context: context, color: colors.text2),
        style: AppTextStyles.smallestCaptionText(
            context: context, color: colors.text1),
        decoration: const BoxDecoration(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
