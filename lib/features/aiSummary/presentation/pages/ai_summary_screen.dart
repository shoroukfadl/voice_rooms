import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/aiSummary/presentation/widget/header.dart';
import 'package:voice_rooms/features/aiSummary/presentation/widget/key_points.dart';
import 'package:voice_rooms/features/aiSummary/presentation/widget/links.dart';
import 'package:voice_rooms/features/createRoom/presentation/widget/tags.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class AiSummaryScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.aiSummary.name;
  const AiSummaryScreen({super.key});

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
          child: AiSummaryHeader(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        const SliverToBoxAdapter(
          child: KeyPoints(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverToBoxAdapter(
              child: TopicTags(),
            )),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverToBoxAdapter(
              child: MentionedLinks(),
            )),
      ],
    );
  }
}
