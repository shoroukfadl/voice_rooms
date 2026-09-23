import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';

class AppSegmentedButton<T> extends StatelessWidget {
  const AppSegmentedButton({
    super.key,
    required this.segments,
    required this.selectedIndex,
    required this.onChanged,
    this.height = 38,
    required this.buildItem,
  });

  final List<T> segments;
  final Widget Function(T item, bool selected) buildItem;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: List.generate(segments.length, (index) {
        final isActive = index == selectedIndex;
        final BorderRadiusGeometry borderRadius = (index == 0)
            ? BorderRadiusDirectional.only(
                topStart: Radius.circular(height / 4),
                bottomStart: Radius.circular(height / 4),
              )
            : index == segments.length - 1
                ? BorderRadiusDirectional.only(
                    topEnd: Radius.circular(height / 4),
                    bottomEnd: Radius.circular(height / 4),
                  )
                : BorderRadiusDirectional.circular(0);
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onChanged(index),
          child: Container(
            height: height,
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive ? colors.accent : colors.surface,
              borderRadius: borderRadius,
            ),
            child: buildItem(segments[index], isActive),
          ),
        );
      }),
    );
  }
}
