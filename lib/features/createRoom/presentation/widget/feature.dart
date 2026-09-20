import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/widgets/interactive_widgets/switch_button.dart';

class NewRoomFeature extends StatelessWidget {
  final Function() onTap;
  const NewRoomFeature({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(cardRadius),
      child: Container(
        decoration: BoxDecoration(
          color: colors.card,
          border: Border.all(color: colors.border),
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Riverpod vs Bloc, live debate',
                      style: AppTextStyles.cardTitleText(
                          context: context, color: colors.text1)),
                  const SizedBox(height: 2),
                  Text('210 tuned in this week',
                      style: AppTextStyles.cardSubtitleText(
                          context: context, color: colors.text2)),
                ],
              ),
            ),
            SwitchButton(active: false, onTap: (value) {}),
          ],
        ),
      ),
    );
  }
}
