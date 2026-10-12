import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/helper_function.dart';
import 'package:roomly/utilities/roomly.dart';
import 'package:roomly/widgets/mainLayout/bottomSheets/new_chat_widget.dart';

class NewChatWidget extends StatelessWidget {
  const NewChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          HelperFunctions.showCustomBottomSheet(
              context, NewChatWidgetBottomSheet());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(pillsRadius),
        ),
        backgroundColor: context.colors.accentSoft,
        child: Icon(
          Roomly.createChat,
          size: 24,
          color: context.colors.accent,
        ));
  }
}
