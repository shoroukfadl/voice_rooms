import 'package:flutter/cupertino.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/createChat/presentation/pages/create_room_screen.dart';
import 'package:roomly/features/home/presentation/pages/home_screen.dart';
import 'package:roomly/features/notifications/presentation/pages/notification_screen.dart';
import 'package:roomly/features/settings/presentation/pages/settings_screen.dart';
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

  static List<ItemBarModel> items(BuildContext context) => [
        ItemBarModel(
          title: context.t.chats,
          icon: Roomly.chats,
          routeName: HomeScreen.routeName,
        ),
        ItemBarModel(
          title: context.t.notifications,
          icon: Roomly.notifications,
          routeName: NotificationScreen.routeName,
        ),
        ItemBarModel(
          title: context.t.calls,
          icon: Roomly.call,
          routeName: CreateChatScreen.routeName,
        ),
        ItemBarModel(
          title: context.t.settings,
          icon: Roomly.settings,
          routeName: SettingsScreen.routeName,
        ),
      ];
}
