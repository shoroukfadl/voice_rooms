import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';

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
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onChanged(index),
          child: Container(
            height: height,
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: buildItem(segments[index], isActive),
          ),
        );
      }),
    );
  }
}
