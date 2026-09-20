import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/widgets/mainLayout/BottomNavBar/item_bar_model.dart';

class BottomNavBarItems extends StatelessWidget {
  const BottomNavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 12,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: colors.accent,
      onTap: (index) {},
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
