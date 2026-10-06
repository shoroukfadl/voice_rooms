import 'package:flutter/material.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/media/rounded_image_widget.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedImage(
      width: 80,
      height: 80,
      backgroundColor: context.colors.accent,
      radiusValue: 100,
    );
  }
}
