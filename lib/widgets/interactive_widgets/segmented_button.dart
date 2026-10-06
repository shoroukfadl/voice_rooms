import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';

class SegmentOption<T> {
  const SegmentOption({
    required this.value,
    required this.label,
    required this.icon,
  });

  final T value;
  final String label;
  final IconData icon;
}

class AnimatedSegmentedButton<T> extends StatelessWidget {
  const AnimatedSegmentedButton({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<SegmentOption<T>> options;
  final T selected;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final n = options.length;
    final index = options.indexWhere((o) => o.value == selected);
    final x = n == 1 ? 0.0 : -1 + 2 * (index < 0 ? 0 : index) / (n - 1);

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(pillsRadius),
      ),
      child: SizedBox(
        height: 40,
        child: Stack(
          children: [
            // Sliding pill
            AnimatedAlign(
              duration: const Duration(milliseconds: 380),
              curve: Curves.easeOutBack,
              alignment: AlignmentDirectional(x, 0),
              child: FractionallySizedBox(
                widthFactor: 1 / n,
                heightFactor: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: cs.accent,
                    borderRadius: BorderRadius.circular(pillsRadius),
                  ),
                ),
              ),
            ),
            // Labels
            Row(
              children: [
                for (final o in options)
                  Expanded(
                    child: _SegmentItem(
                      option: o,
                      isSelected: o.value == selected,
                      onTap: () => onChanged(o.value),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SegmentItem<T> extends StatelessWidget {
  const _SegmentItem({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  final SegmentOption<T> option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = context.colors;
    final target = isSelected ? Colors.white : cs.text1;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(pillsRadius),
        onTap: onTap,
        child: Center(
          child: TweenAnimationBuilder<Color?>(
            duration: const Duration(milliseconds: 250),
            tween: ColorTween(end: target),
            builder: (context, color, _) => Text(option.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.b12(color: target)),
          ),
        ),
      ),
    );
  }
}
