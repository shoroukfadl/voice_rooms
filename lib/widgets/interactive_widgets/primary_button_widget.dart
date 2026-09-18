import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/widgets/helper/hover_widget.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_button_widget.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const PrimaryButtonWidget(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return HoverWidget(
        builder: (hover) => CustomButtonWidget(
              height: 48,
              title: title,
              onPressed: onTap,
              btnColor: hover ? colors.accentSoft : colors.accent,
              borderRadiusValue: cardRadius,
              titleColor: Colors.white,
            ));
  }
}
