import 'package:flutter/material.dart';
import 'package:roomly/features/aiSummary/presentation/widget/header.dart';
import 'package:roomly/features/aiSummary/presentation/widget/key_points.dart';
import 'package:roomly/features/aiSummary/presentation/widget/links.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

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
        ScreenSpacer(),
        MentionedLinks().asPaddedSliver(),
      ],
    );
  }
}
