import 'package:flutter/cupertino.dart';
import 'package:roomly/features/createChat/presentation/pages/create_room_screen.dart';
import 'package:roomly/features/groups/presentation/pages/groups_screen.dart';
import 'package:roomly/features/home/presentation/pages/home_screen.dart';
import 'package:roomly/features/notifications/presentation/pages/notification_screen.dart';
import 'package:roomly/features/profile/presentation/pages/profile_screen.dart';
import 'package:roomly/utilities/roomly.dart';

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
      title: "Strings.chatsListTitle",
      icon: Roomly.chats,
      routeName: HomeScreen.routeName,
    ),
    ItemBarModel(
      title: "Strings.groupsStatLabel",
      icon: Roomly.groups,
      routeName: GroupsScreen.routeName,
    ),
    ItemBarModel(
      title: 'chat',
      icon: Roomly.createChat,
      routeName: CreateChatScreen.routeName,
    ),
    ItemBarModel(
      title: " Strings.notifications",
      icon: Roomly.notifications,
      routeName: NotificationScreen.routeName,
    ),
    ItemBarModel(
      title: "Strings.profile",
      icon: Roomly.profile,
      routeName: ProfileScreen.routeName,
    ),
  ];
}
