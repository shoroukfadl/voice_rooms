import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/ai_summery.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/controllers.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/header.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/listeners_section.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/room_stats_widget.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/speakers/speakers_section.dart';
import 'package:voice_rooms/features/home/presentation/widget/live_badg.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
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
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverToBoxAdapter(
              child: LiveBadg(),
            )),
        const SliverToBoxAdapter(
          child: ActiveRoomHeader(
            roomName: 'Flutter devs Egypt',
            subtitle: "Talking about state management",
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverToBoxAdapter(
              child: RoomStatsRow(
                  liveMinutes: 20, listenersCount: 10, speakingCount: 2),
            )),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverToBoxAdapter(
              child: SpeakersSection(),
            )),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverToBoxAdapter(
                child: ListenersSection(listenersCount: 10))),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverToBoxAdapter(
              child: AiSummaryCard(preview: 'AI summary'),
            )),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
          sliver: SliverToBoxAdapter(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: ActiveRoomControls(
              isSelfMuted: false,
              onLeave: () {},
              onRaiseHand: () {},
              onToggleMute: () {},
            ),
          )),
        ),
      ],
    );
  }
}
