import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/enums.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/chat/data/model/chat_model.dart';
import 'package:roomly/features/chatProfile/data/model/chat_member_model.dart';
import 'package:roomly/features/chatProfile/presentation/widget/avatar.dart';
import 'package:roomly/features/chatProfile/presentation/widget/group_details_widget.dart';
import 'package:roomly/features/chatProfile/presentation/widget/individual_details_widget.dart';
import 'package:roomly/features/chatProfile/presentation/widget/vedio.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class ChatProfileScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.chatProfile.name;
  const ChatProfileScreen({
    super.key,
    required this.chatType,
    this.name,
    this.phoneNumber,
    this.about,
    this.language,
    this.mediaCount,
    this.isMuted,
    this.members,
  });

  final ChatType chatType;
  final String? name;
  final String? phoneNumber;
  final String? about;
  final String? language;
  final int? mediaCount;
  final bool? isMuted;
  final List<ChatMember>? members;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return ScreenLayoutWidget(
      children: [
        AvatarWidget(chatType: chatType, name: name).asSliver(),
        ScreenSpacer(),
        // Name
        if (name != null)
          Text(
            name!,
            style: AppTextStyles.h20(color: colors.text1),
          ).asPaddedSliver(),

        if (chatType == ChatType.direct && phoneNumber != null)
          Text(
            phoneNumber!,
            style: AppTextStyles.t14(color: colors.text2),
          ).asPaddedSliver()
        else if (chatType == ChatType.group && members != null)
          Text(
            strings.groupMembers(members!.length),
            style: AppTextStyles.t14(color: colors.text2),
          ).asPaddedSliver(),
        VideoWidget().asPaddedSliver(),
        // Details Section
        if (chatType == ChatType.direct)
          IndividualDetailsWidget(
            about: about,
            language: language,
            mediaCount: mediaCount,
            isMuted: isMuted,
          ).asSliver()
        else if (members != null)
          GroupDetailsWidget(members: members!).asPaddedSliver(),
      ],
    );
  }
}
