import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class MicStatusDot extends StatelessWidget {
  final bool isMuted;
  const MicStatusDot({super.key, required this.isMuted});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isMuted ? colors.card : colors.success,
        border: Border.all(color: colors.surface, width: 2),
      ),
      child: Icon(
        isMuted ? Roomly.muted : Roomly.mic,
        size: 10,
        color: isMuted ? colors.text3 : Colors.white,
      ),
    );
  }
}
