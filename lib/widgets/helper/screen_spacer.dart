import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';

class ScreenSpacer extends StatelessWidget {
  const ScreenSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: smallSectionSpacing,
      ),
    );
  }
}
