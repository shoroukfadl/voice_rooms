import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/chat/presentation/widget/chat_header.dart';
import 'package:roomly/features/chat/presentation/widget/chat_input_bar.dart';
import 'package:roomly/features/chat/presentation/widget/chat_message_bubble.dart';
import 'package:roomly/features/chat/presentation/widget/day_chip.dart';
import 'package:roomly/utilities/constants/enums.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.chat.name;
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          children: [
            const ChatHeader(
              name: 'Salma Nour',
              subtitle: 'Online',
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: mobileHozPadding, vertical: 12),
                children: const [
                  DayChip(),
                  SizedBox(height: 16),
                  ChatMessageBubble(
                    message: 'Hey! Are we still on for the design review?',
                    time: '2:36 PM',
                    isIncoming: true,
                  ),
                  SizedBox(height: 12),
                  ChatMessageBubble(
                    message: "Yep, I'll share my screen at 6",
                    time: '2:38 PM',
                    isIncoming: false,
                  ),
                  SizedBox(height: 12),
                  ChatMessageBubble(
                    message: "Perfect, I'll bring the updated mockups too",
                    time: '2:39 PM',
                    isIncoming: true,
                  ),
                  SizedBox(height: 12),
                  ChatMessageBubble(
                    message: 'Sounds good, see you at 6! 🎉',
                    time: '2:41 PM',
                    isIncoming: false,
                  ),
                ],
              ),
            ),
            const ChatInputBar(),
          ],
        ),
      ),
    );
  }
}
