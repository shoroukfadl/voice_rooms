import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/widgets/helper/hover_widget.dart';
import 'package:roomly/widgets/interactive_widgets/custom_button_widget.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final double height;
  final bool loading;
  const PrimaryButtonWidget(
      {super.key,
      this.loading = false,
      this.height = 56,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return HoverWidget(
        builder: (hover) => CustomButtonWidget(
              height: height,
              title: title,
              onPressed: onTap,
              isLoading: loading,
              btnColor: hover ? colors.accentSoft : colors.accent,
              borderRadiusValue: cardRadius,
              titleColor: Colors.white,
            ));
  }
}
