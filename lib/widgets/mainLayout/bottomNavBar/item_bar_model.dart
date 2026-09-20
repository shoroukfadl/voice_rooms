import 'package:flutter/cupertino.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class ItemBarModel {
  final String title;
  final IconData icon;
  final Function onTap;
  final bool isActive;
  ItemBarModel(
      {required this.title,
      required this.icon,
      required this.onTap,
      required this.isActive});

  static List<ItemBarModel> items = [
    ItemBarModel(
        title: Strings.home,
        icon: Roomly.iconsax1,
        onTap: () {},
        isActive: true),
    ItemBarModel(
        title: Strings.explore,
        icon: Roomly.explore,
        onTap: () {},
        isActive: false),
    ItemBarModel(
        title: Strings.profile,
        icon: Roomly.profile,
        onTap: () {},
        isActive: false),
    ItemBarModel(
        title: Strings.settings,
        icon: Roomly.settings,
        onTap: () {},
        isActive: false),
  ];
}
