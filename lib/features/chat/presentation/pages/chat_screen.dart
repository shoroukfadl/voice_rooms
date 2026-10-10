import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/chat/data/model/chat_model.dart';
import 'package:roomly/features/chat/presentation/widget/chat_action_buttons.dart';
import 'package:roomly/features/chat/presentation/widget/chat_header.dart';
import 'package:roomly/features/chat/presentation/widget/chat_input_bar.dart';
import 'package:roomly/features/chat/presentation/widget/chat_message_bubble.dart';
import 'package:roomly/features/chat/presentation/widget/chat_profile_screen.dart';
import 'package:roomly/features/chat/presentation/widget/day_chip.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/widgets/helper/divider.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.chat.name;
  const ChatScreen({
    super.key,
    this.chatType = ChatType.direct,
    this.name,
    this.subtitle,
  });

  final ChatType chatType;
  final String? name;
  final String? subtitle;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final strings = context.t;

    return ScreenLayoutWidget(
      children: [
        ChatHeader(
          name: widget.name ?? "SHorouk Fadl",
          subtitle: widget.subtitle ?? strings.online,
          onTapMenu: () => _showProfileScreen(context),
        ).asSliver(),
        const HozDivider().asPaddedSliver(),
        SliverList.list(
          children: [
            const DayChip(),
            const SizedBox(height: 16),
            ChatMessageBubble(
              message: 'Hey! Are we still on for the design review?',
              time: '2:36 PM',
              isIncoming: true,
              translatedFrom: 'English',
              translatedMessage: 'مرحبا! هل ما زلنا في مراجعة التصميم؟',
            ),
            const SizedBox(height: 12),
            ChatMessageBubble(
              message: "Yep, I'll share my screen at 6",
              time: '2:38 PM',
              isIncoming: false,
            ),
            const SizedBox(height: 12),
            ChatMessageBubble(
              message: "Perfect, I'll bring the updated mockups too",
              time: '2:39 PM',
              isIncoming: true,
            ),
            const SizedBox(height: 12),
            ChatMessageBubble(
              message: 'Sounds good, see you at 6! 🎉',
              time: '2:41 PM',
              isIncoming: false,
            ),
            const SizedBox(height: 16),
            ChatActionButtons(
              onTranslate: () {},
              onSummarize: () {},
              onCorrect: () {},
            ),
          ],
        ),
        ChatInputBar(
          suggestedMessage: "I'll send it before the deadline.",
          onSuggestionTap: () {},
        ).asPaddedSliver(),
      ],
    );
  }

  void _showProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatProfileScreen(
          chatType: widget.chatType,
          name: widget.name ?? 'Mark Reyes',
          phoneNumber:
              widget.chatType == ChatType.direct ? '+1 415 xxx xxxx' : null,
          about: 'Product manager',
          language: 'English',
          mediaCount: 24,
          isMuted: false,
          members: widget.chatType == ChatType.group
              ? [
                  ChatMember(
                    name: 'سارة كمال',
                    initial: 'س',
                    isAdmin: true,
                  ),
                  ChatMember(
                    name: 'Mark Reyes',
                    initial: 'M',
                  ),
                  ChatMember(
                    name: 'نور الدين',
                    initial: 'ن',
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
