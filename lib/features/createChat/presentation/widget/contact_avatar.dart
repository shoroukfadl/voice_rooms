import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/extensions.dart';

class ContactAvatar extends StatelessWidget {
  final String initials;
  final Color backgroundColor;
  final double size;
  final bool showOnlineDot;
  final bool isSelected;

  const ContactAvatar({
    super.key,
    required this.initials,
    required this.backgroundColor,
    this.size = 44,
    this.showOnlineDot = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: size,
      height: size + (showOnlineDot ? 4 : 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: AppTextStyles.captionText(
                context: context,
                color: colors.surface,
              ),
            ),
          ),
          if (isSelected)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.accent, width: 2),
                ),
              ),
            ),
          if (showOnlineDot)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: size * 0.27,
                height: size * 0.27,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.success,
                  border: Border.all(color: colors.surface, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
