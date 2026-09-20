import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/widgets/helper/hover_widget.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_button_widget.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final double height, width;
  const SecondaryButtonWidget(
      {super.key,
      this.height = 56,
      this.width = double.infinity,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return HoverWidget(
        builder: (hover) => CustomButtonWidget(
              height: height,
              title: title,
              width: width,
              onPressed: onTap,
              borderColor: colors.border,
              btnColor: hover ? colors.card : colors.surface,
              borderRadiusValue: cardRadius,
              titleColor: colors.text1,
            ));
  }
}
