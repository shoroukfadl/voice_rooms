import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/interactive_widgets/custom_text_field.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key});

  _ChatInputBarState createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  TextEditingController message = TextEditingController();
  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomTextField(
      controller: message,
      hint: 'send message ',
      keyboardType: TextInputType.multiline,
      prefixIcon: Roomly.add,
      borderRadius: 0,
      suffixIcon: Container(
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: colors.accent,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Icon(Roomly.send, size: 20, color: colors.accentSoft),
      ),
    );
  }
}
