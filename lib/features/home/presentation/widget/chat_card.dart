import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/chat/presentation/pages/chat_screen.dart';
import 'package:roomly/features/home/presentation/widget/unreaded_messages.dart';
import 'package:roomly/widgets/media/rounded_image_widget.dart';

class ChatCard extends StatelessWidget {
  final bool isLast;
  const ChatCard({super.key, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: () {
        context.goNamed(ChatScreen.routeName);
      },
      child: Container(
          margin: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
              border: isLast
                  ? null
                  : Border(
                      bottom: BorderSide(color: colors.border),
                    )),
          child: Row(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedImage(
                width: 64,
                height: 64,
                imagePath: '',
                radiusValue: 100,
                backgroundColor: colors.accentSoft,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      Text(
                        'Voice Room 1',
                        style: AppTextStyles.cardTitleText(
                            context: context, color: colors.text1),
                      ).expand,
                      Text(
                        '02:24 PM',
                        style: AppTextStyles.chipText(
                            context: context, color: colors.text3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    spacing: 16,
                    children: [
                      Text(
                        'Talking about state management',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardSubtitleText(
                            context: context, color: colors.text2),
                      ).expand,
                      UnReadedMessages()
                    ],
                  ),
                ],
              ).expand,
            ],
          )),
    );
  }
}
