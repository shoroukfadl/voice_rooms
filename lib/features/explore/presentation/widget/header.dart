import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/utilities/constants/strings.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      Strings.exploreTitle.translate,
      style: AppTextStyles.screenTitle(context: context, color: colors.text1),
    ).paddingSymmetric(horizontal: mobileHozPadding);
  }
}
