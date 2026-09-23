import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) => FilterChipWidget(
                onTap: () {},
                label: 'Filter $i',
                isActive: i == 0,
              ),
          separatorBuilder: (c, i) => const SizedBox(
                width: 16,
              ),
          itemCount: 5),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({
    required this.label,
    required this.isActive,
    required this.onTap,
    this.height,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: height,
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
          color: isActive ? colors.accentSoft : colors.surface,
          borderRadius: BorderRadius.circular(cardRadius / 1.5),
          border:
              isActive ? null : Border.all(color: colors.border, width: 0.5),
        ),
        child: Text(
          label,
          style: AppTextStyles.chipText(
            context: context,
            color: isActive ? colors.accent : colors.text2,
          ),
        ),
      ),
    );
  }
}
