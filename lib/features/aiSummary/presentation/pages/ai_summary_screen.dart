import 'package:flutter/material.dart';
import 'package:voice_rooms/features/aiSummary/presentation/widget/header.dart';
import 'package:voice_rooms/features/aiSummary/presentation/widget/key_points.dart';
import 'package:voice_rooms/features/aiSummary/presentation/widget/links.dart';
import 'package:voice_rooms/features/createRoom/presentation/widget/tags.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/helper/screen_spacer.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class AiSummaryScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.aiSummary.name;
  const AiSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        AiSummaryHeader().asSliver(),
        ScreenSpacer(),
        KeyPoints().asSliver(),
        ScreenSpacer(),
        TopicTags().asPaddedSliver(),
        ScreenSpacer(),
        MentionedLinks().asPaddedSliver(),
      ],
    );
  }
}
