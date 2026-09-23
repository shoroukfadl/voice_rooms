import 'package:flutter/material.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/media/rounded_image_widget.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedImage(
      width: 72,
      height: 72,
      backgroundColor: context.colors.accentSoft,
      radiusValue: 100,
    );
  }
}
