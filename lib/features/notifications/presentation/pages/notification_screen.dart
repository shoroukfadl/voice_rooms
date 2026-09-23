import 'package:flutter/cupertino.dart';
import 'package:voice_rooms/features/notifications/presentation/widget/header.dart';
import 'package:voice_rooms/features/notifications/presentation/widget/notification_card.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/helper/screen_spacer.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.notifications.name;
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        NotificationHeader().asSliver(),
        ScreenSpacer(),
        SliverList.separated(
            itemBuilder: (c, i) => NotificationCard(),
            separatorBuilder: (c, i) => const SizedBox(
                  height: 16,
                ),
            itemCount: 10),
      ],
    );
  }
}
