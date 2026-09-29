import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/boarding/presentation/widget/logo_widget.dart';
import 'package:roomly/features/login/presentation/pages/login_screen.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';

class BoardingScreen extends StatelessWidget {
  static String routeName = '/';
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = context.t;
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: mobileHozPadding, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoWidget(),
          const SizedBox(height: 16),
          Text(
            tr.appName,
            style: AppTextStyles.h26(color: colors.text1),
          ),
          const SizedBox(height: 8),
          Text(
            context.t.welcomeTagline,
            style: AppTextStyles.b16(color: colors.text3),
          ),
          const CustomSpacer.L(),
          PrimaryButtonWidget(
              title: tr.getStarted,
              onTap: () {
                context.goNamed(LoginScreen.routeName);
              })
        ],
      ),
    ));
  }
}
