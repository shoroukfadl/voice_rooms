import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';

class GroupHeader extends StatelessWidget {
  const GroupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      "Strings.groupsStatLabel.translate",
      style: AppTextStyles.screenTitle(context: context, color: colors.text1),
    ).paddingSymmetric(horizontal: mobileHozPadding);
  }
}
