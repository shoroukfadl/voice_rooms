import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/BottomNavBar/item_bar_model.dart';

class BottomNavBarItems extends StatelessWidget {
  final String? currentPath;
  const BottomNavBarItems({super.key, this.currentPath});

  @override
  Widget build(BuildContext context) {
    final index = ItemBarModel.items(context)
        .indexWhere((e) => e.routeName == currentPath?.replaceAll('/', ""));
    return NotchedBottomNav(
      currentIndex: index < 0 ? 0 : index,
      onTap: (index) {
        context.goNamed(
          ItemBarModel.items(context)[index].routeName,
        );
      },
      items: ItemBarModel.items(context),
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

  static const double _barHeight = 68;
  static const double _fabSize = 56;
  static const double _fabTopOffset = -14;
  static const double _notchDepth = 24;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final colors = context.colors;
    final totalHeight = _barHeight + bottomInset;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: totalHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _NotchPainter(
                    notchX: -1,
                    depth: _notchDepth,
                    color: colors.card,
                    showNotch: false,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: _barHeight,
                child: Row(
                  children: [
                    for (int i = 0; i < items.length; i++)
                      _buildNavItem(context, i, colors).expand,
                  ],
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

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(i),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 150),
            scale: selected ? 1.1 : 1.0,
            child: Icon(item.icon, size: 28, color: color),
          ),
          const CustomSpacer.S(),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: AppTextStyles.t14(color: color),
            child: Text(item.title.toUpperCase()),
          ),
        ],
      ),
    );
  }
}

class _FabItem extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final double size;
  final Color accent;
  final Color card;
  final Color border;
  final Color unselectedIconColor;
  final VoidCallback onTap;

  const _FabItem({
    required this.selected,
    required this.icon,
    required this.size,
    required this.accent,
    required this.card,
    required this.border,
    required this.unselectedIconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: selected ? accent : card,
          shape: BoxShape.circle,
          border: Border.all(color: border, width: 0.5),
          boxShadow: [
            BoxShadow(
              // Shadow tints toward the accent color once selected instead
              // of staying flat black, so the "selected" state reads more
              // clearly at a glance.
              color: (selected ? accent : Colors.black)
                  .withOpacity(selected ? 0.28 : 0.12),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        // Unselected icon now matches the same `text2` color used by the
        // other nav items instead of a separate `text1`, so the visual
        // language is consistent across all items.
        child: Icon(
          icon,
          color: selected ? Colors.white : unselectedIconColor,
          size: 26,
        ),
      ),
    );
  }
}

class _NotchPainter extends CustomPainter {
  final double notchX;
  final double depth;
  final Color color;
  final bool showNotch;

  _NotchPainter({
    required this.notchX,
    required this.depth,
    required this.color,
    required this.showNotch,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    if (showNotch && notchX >= 0) {
      const half = 36.0; // half-width of the notch
      path
        ..moveTo(0, 0)
        ..lineTo(notchX - half, 0)
        ..cubicTo(
            notchX - half * 0.5, 0, notchX - half * 0.55, depth, notchX, depth)
        ..cubicTo(notchX + half * 0.55, depth, notchX + half * 0.5, 0,
            notchX + half, 0)
        ..lineTo(size.width, 0);
    } else {
      // No FAB (e.g. only 1-2 nav items) -> plain flat top edge, no notch.
      path
        ..moveTo(0, 0)
        ..lineTo(size.width, 0);
    }

    path
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.15), 6, false);
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_NotchPainter old) =>
      old.notchX != notchX ||
      old.depth != depth ||
      old.color != color ||
      old.showNotch != showNotch;
}
