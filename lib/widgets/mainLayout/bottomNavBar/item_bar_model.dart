import 'package:flutter/cupertino.dart';
import 'package:voice_rooms/features/explore/presentation/pages/explore_screen.dart';
import 'package:voice_rooms/features/home/presentation/pages/home_screen.dart';
import 'package:voice_rooms/features/notifications/presentation/pages/notification_screen.dart';
import 'package:voice_rooms/features/profile/presentation/pages/profile_screen.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class ItemBarModel {
  final String title;
  final IconData icon;
  final String routeName;
  ItemBarModel({
    required this.title,
    required this.icon,
    required this.routeName,
  });

  static List<ItemBarModel> items = [
    ItemBarModel(
      title: Strings.home,
      icon: Roomly.roomly,
      routeName: HomeScreen.routeName,
    ),
    ItemBarModel(
      title: Strings.explore,
      icon: Roomly.explore,
      routeName: ExploreScreen.routeName,
    ),
    ItemBarModel(
      title: Strings.notifications,
      icon: Roomly.notifications,
      routeName: NotificationScreen.routeName,
    ),
    ItemBarModel(
      title: Strings.profile,
      icon: Roomly.profile,
      routeName: ProfileScreen.routeName,
    ),
  ];
}
