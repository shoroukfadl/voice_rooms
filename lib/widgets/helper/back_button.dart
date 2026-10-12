import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/utilities/roomly.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
        onTap: () => context.pop(),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: colors.secondarySoft,
          child: Icon(
            Roomly.arrowLeft,
            size: 18,
            color: colors.secondary,
          ),
        ));
  }
}
