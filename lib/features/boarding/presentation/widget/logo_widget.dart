import 'package:flutter/material.dart';
import 'package:roomly/generated/assets.dart';
import 'package:roomly/widgets/media/rounded_image_widget.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedImage(
      imagePath: Assets.images.logo.path,
      width: 240,
      height: 240,
      fit: BoxFit.contain,
      backgroundColor: Colors.transparent,
    );
  }
}
