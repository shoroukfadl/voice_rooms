import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/generated/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Card(
      elevation: 0,
      color: colors.accentSoft,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Image.asset(
          Assets.images.logo.path,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
