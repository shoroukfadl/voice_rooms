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

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final colors = context.colors;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final centerX = width / 2;

        return SizedBox(
          height: _height + bottomInset,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Background with notch painter
              Positioned.fill(
                child: CustomPaint(
                  painter: _NotchPainter(
                    notchX: centerX,
                    depth: 26,
                    color: colors.card,
                  ),
                ),
              ),
              // Content Row for items
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: _height,
                child: Padding(
                  padding: EdgeInsets.only(bottom: bottomInset),
                  child: Row(
                    children: [
                      if (items.isNotEmpty) _buildNavItem(context, 0, colors),
                      if (items.length > 1) _buildNavItem(context, 1, colors),
                      // Spacer for center FAB
                      const Expanded(child: SizedBox()),
                      if (items.length > 3)
                        _buildNavItem(context, 3, colors)
                      else if (items.length > 2)
                        _buildNavItem(context, 3, colors),
                    ],
                  ),
                ),
              ),
              // Center Floating Action Button for the 3rd item (index 2)
              if (items.length > 2)
                Positioned(
                  left: centerX - 28,
                  top: -16,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onTap(2),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: currentIndex == 2 ? colors.accent : colors.card,
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.border, width: 0.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        items[2].icon,
                        color: currentIndex == 2 ? Colors.white : colors.text1,
                        size: 26,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, int i, dynamic colors) {
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
            Icon(
              item.icon,
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Text(
              item.title.translate,
              style:
                  AppTextStyles.navBarTitleText(context: context, color: color),
            ),
          ],
        ),
      ),
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
    const half = 36.0; // half-width of the notch
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
