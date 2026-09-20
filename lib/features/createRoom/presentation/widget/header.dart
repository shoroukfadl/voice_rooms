import 'package:flutter/cupertino.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';

class CreateRoomHeader extends StatelessWidget {
  const CreateRoomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      Strings.createRoomScreenTitle.translate,
      style: AppTextStyles.screenTitle(context: context, color: colors.text1),
    ).paddingSymmetric(horizontal: mobileHozPadding);
  }
}
