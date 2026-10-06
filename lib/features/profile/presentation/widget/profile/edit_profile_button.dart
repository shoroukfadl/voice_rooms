import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/utilities/roomly.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = context.t;
    return InkWell(
      onTap: () {},
      child: Icon(
        Roomly.editProfile,
        color: colors.accent,
        size: 24,
      ),
    );
  }
}
