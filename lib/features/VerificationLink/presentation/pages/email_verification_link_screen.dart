import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/VerificationLink/presentation/widget/header.dart';
import 'package:voice_rooms/features/resetLink/presentation/widget/login.dart';
import 'package:voice_rooms/features/resetLink/presentation/widget/resend_email.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';

class EmailVerificationLinkScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.verifyEmail.name;
  const EmailVerificationLinkScreen({super.key});

  @override
  State<EmailVerificationLinkScreen> createState() =>
      _EmailVerificationLinkScreenState();
}

class _EmailVerificationLinkScreenState
    extends State<EmailVerificationLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: LoginWidget(),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: mobileHozPadding,
          ),
          child: Column(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EmailLinkHeader(),
              ResendEmailWidget(),
            ],
          ),
        ));
  }
}
