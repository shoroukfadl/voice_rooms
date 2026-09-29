import 'package:flutter/cupertino.dart';
import 'package:roomly/features/notifications/presentation/widget/header.dart';
import 'package:roomly/features/notifications/presentation/widget/notification_card.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

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
            itemBuilder: (c, i) => NotificationCard(
                  isLast: i == 9,
                ),
            separatorBuilder: (c, i) => const SizedBox(
                  height: 16,
                ),
            itemCount: 10),
      ],
    );
  }
}
