import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/core/Language/app_styles.dart';
import 'package:voice_rooms/features/login/presentation/pages/login_screen.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/utilities/roomly.dart';
import 'package:voice_rooms/widgets/helper/icon_with_background.dart';
import 'package:voice_rooms/widgets/interactive_widgets/primary_button_widget.dart';

class BoardingScreen extends StatelessWidget {
  static String routeName = '/';
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
        body: Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: mobileHozPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          IconWithBackground(
              background: colors.accentSoft,
              iconColor: colors.accent,
              icon: Roomly.roomly,
              size: 80),
          const SizedBox(height: 16),
          Text(
            Strings.onboardingTitle.translate,
            style: AppTextStyles.onboardingTitle(
                context: context, color: colors.text1),
          ),
          const SizedBox(height: 8),
          Text(
            Strings.onboardingSubtitle.translate,
            style: AppTextStyles.screenSubtitleText(
                context: context, color: colors.text3),
          ),
          Spacer(),
          PrimaryButtonWidget(
              title: Strings.continueButton.translate,
              onTap: () {
                context.goNamed(LoginScreen.routeName);
              }),
          const SizedBox(height: 40),
        ],
      ),
    ));
  }
}
