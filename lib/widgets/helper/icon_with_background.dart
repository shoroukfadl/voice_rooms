import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';

class IconWithBackground extends StatelessWidget {
  final Color background, iconColor;
  final IconData icon;
  final double size;
  const IconWithBackground(
      {super.key,
      required this.background,
      required this.iconColor,
      required this.icon,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }
}
