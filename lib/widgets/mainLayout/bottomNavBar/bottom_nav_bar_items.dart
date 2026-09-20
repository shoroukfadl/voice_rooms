import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 12,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: colors.accent,
      currentIndex: index < 0 ? 0 : index,
      onTap: (index) {
        context.goNamed(
          ItemBarModel.items[index].routeName,
        );
      },
      items: [
        ...ItemBarModel.items.map((e) => BottomNavigationBarItem(
              backgroundColor: colors.background,
              activeIcon: CircleAvatar(
                radius: 28,
                backgroundColor: colors.accentSoft,
                child: Icon(
                  e.icon,
                  size: 28,
                  color: colors.accent,
                ),
              ),
              icon: CircleAvatar(
                radius: 28,
                backgroundColor: colors.border,
                child: Icon(
                  e.icon,
                  size: 28,
                  color: colors.text2,
                ),
              ),
              label: e.title,
            ))
      ],
    );
  }
}
