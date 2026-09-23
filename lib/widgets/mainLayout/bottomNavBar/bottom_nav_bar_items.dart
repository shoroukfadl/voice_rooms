import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/widgets/mainLayout/BottomNavBar/item_bar_model.dart';

class BottomNavBarItems extends StatelessWidget {
  final String? currentPath;
  const BottomNavBarItems({super.key, this.currentPath});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final index = ItemBarModel.items
        .indexWhere((e) => e.routeName == currentPath?.replaceAll('/', ""));
    return NotchedBottomNav(
      currentIndex: index < 0 ? 0 : index,
      onTap: (index) {
        context.goNamed(
          ItemBarModel.items[index].routeName,
        );
      },
      items: ItemBarModel.items,
    );
  }
}

class NotchedBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<ItemBarModel> items;

  const NotchedBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items = const [],
  });

  static const double _height = 78;
  static const double _notchDepth = 16;
  static const double _dotSize = 12;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final colors = context.colors;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemWidth = width / items.length;
        final targetX = itemWidth * (currentIndex + 0.5);

        return SizedBox(
          height: _height + bottomInset,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(end: targetX),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
            builder: (context, notchX, _) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _NotchPainter(
                        notchX: notchX,
                        depth: _notchDepth,
                        color: colors.card,
                      ),
                    ),
                  ),

                  // Blue dot sitting in the notch
                  Positioned(
                    top: 2,
                    left: notchX - _dotSize / 2,
                    child: Container(
                      width: _dotSize,
                      height: _dotSize,
                      decoration: BoxDecoration(
                        color: colors.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  // Items
                  Positioned.fill(
                    top: _notchDepth + 4,
                    bottom: bottomInset,
                    child: Row(
                      children: List.generate(items.length, (i) {
                        final selected = i == currentIndex;
                        final item = items[i];
                        final color = selected ? colors.accent : colors.text2;

                        return Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => onTap(i),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  transitionBuilder: (child, anim) =>
                                      ScaleTransition(
                                          scale: anim, child: child),
                                  child: Icon(
                                    item.icon,
                                    key: ValueKey('$i-$selected'),
                                    size: 28,
                                    color: color,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: AppTextStyles.navBarTitleText(
                                      context: context, color: color),
                                  child: Text(item.title.translate),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _NotchPainter extends CustomPainter {
  final double notchX;
  final double depth;
  final Color color;

  _NotchPainter(
      {required this.notchX, required this.depth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const half = 40.0; // half-width of the notch
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(notchX - half, 0)
      ..cubicTo(
          notchX - half * 0.5, 0, notchX - half * 0.55, depth, notchX, depth)
      ..cubicTo(
          notchX + half * 0.55, depth, notchX + half * 0.5, 0, notchX + half, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.15), 6, false);
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_NotchPainter old) =>
      old.notchX != notchX || old.depth != depth || old.color != color;
}
