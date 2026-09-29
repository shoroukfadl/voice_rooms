import 'dart:io';

import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/utilities/file_picker_helper.dart';

class AvatarPickerWidget extends StatelessWidget {
  final String? selectedAvatarPath;
  final VoidCallback onTap;

  const AvatarPickerWidget({
    super.key,
    required this.selectedAvatarPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.card,
              border: Border.all(color: colors.border, width: 2),
            ),
            child: selectedAvatarPath != null
                ? ClipOval(
                    child: Image.file(
                      File(selectedAvatarPath!),
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: 40,
                    color: colors.text3,
                  ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.accent,
                border: Border.all(color: colors.card, width: 2),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
