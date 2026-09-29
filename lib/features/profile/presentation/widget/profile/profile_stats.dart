import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';

class ProfileStatsRow extends StatelessWidget {
  final int groups, contacts;
  const ProfileStatsRow({
    super.key,
    required this.groups,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40,
      children: [
        StatPill(
            number: groups.toString(),
            label: "Strings.groupsStatLabel.translate"),
        StatPill(
            number: contacts.toString(),
            label: "Strings.contactsStatLabel.translate"),
      ],
    );
  }
}

class StatPill extends StatelessWidget {
  final String label, number;
  const StatPill({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(number,
            style: AppTextStyles.statNumberText(
                context: context, color: colors.text1)),
        Text(label,
            style: AppTextStyles.captionText(
                context: context, color: colors.text2)),
      ],
    );
  }
}
