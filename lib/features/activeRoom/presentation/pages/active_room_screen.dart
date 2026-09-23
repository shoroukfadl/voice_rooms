import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/ai_summery.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/header.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/listeners_section.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/room_stats_widget.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/speakers/speakers_section.dart';
import 'package:voice_rooms/features/aiSummary/presentation/pages/ai_summary_screen.dart';
import 'package:voice_rooms/features/home/presentation/widget/live_badg.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/helper/screen_spacer.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class ActiveRoomScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.activeRoom.name;
  const ActiveRoomScreen({super.key});

  @override
  State<ActiveRoomScreen> createState() => _ActiveRoomScreenState();
}

class _ActiveRoomScreenState extends State<ActiveRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        LiveBadg().asPaddedSliver(),
        ActiveRoomHeader(
          roomName: 'Flutter devs Egypt',
          subtitle: "Talking about state management",
        ).asSliver(),
        ScreenSpacer(),
        RoomStatsRow(liveMinutes: 20, listenersCount: 10, speakingCount: 2)
            .asPaddedSliver(),
        ScreenSpacer(),
        SpeakersSection().asPaddedSliver(),
        ScreenSpacer(),
        ListenersSection(listenersCount: 10).asPaddedSliver(),
        ScreenSpacer(),
        AiSummaryCard(
          preview: 'AI summary',
          onTap: () {
            context.goNamed(AiSummaryScreen.routeName);
          },
        ).asPaddedSliver(),
      ],
    );
  }
}
