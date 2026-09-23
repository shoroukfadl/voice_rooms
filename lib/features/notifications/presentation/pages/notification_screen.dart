import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/notifications/presentation/widget/header.dart';
import 'package:voice_rooms/features/notifications/presentation/widget/notification_card.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.notifications.name;
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
        ),
        const SliverToBoxAdapter(
          child: NotificationHeader(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
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
