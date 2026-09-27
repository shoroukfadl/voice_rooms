import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/core/Language/app_styles.dart';
import 'package:roomly/features/home/presentation/pages/home_screen.dart';
import 'package:roomly/generated/assets.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';
import 'package:roomly/widgets/media/rounded_image_widget.dart';

class BoardingScreen extends StatelessWidget {
  static String routeName = '/';
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
        bottomNavigationBar: SafeArea(
            minimum: EdgeInsets.symmetric(
                horizontal: mobileHozPadding, vertical: 40),
            child: PrimaryButtonWidget(
                title: Strings.continueButton.translate,
                onTap: () {
                  context.goNamed(HomeScreen.routeName);
                })),
        body: SafeArea(
          minimum:
              EdgeInsets.symmetric(horizontal: mobileHozPadding, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedImage(
                imagePath: Assets.images.logo.path,
                width: 240,
                height: 240,
                fit: BoxFit.contain,
                backgroundColor: Colors.transparent,
              ),
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
            ],
          ),
        ));
  }
}
