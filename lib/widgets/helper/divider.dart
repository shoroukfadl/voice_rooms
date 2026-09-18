import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';

class HozDivider extends StatelessWidget {
  const HozDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Divider(
      thickness: 2,
      color: colors.border,
    );
  }
}
