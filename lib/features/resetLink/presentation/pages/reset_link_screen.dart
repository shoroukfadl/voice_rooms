import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/resetLink/presentation/widget/login.dart';
import 'package:voice_rooms/features/resetLink/presentation/widget/resend_email.dart';
import 'package:voice_rooms/features/resetLink/presentation/widget/rest_header.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';

class ResetLinkScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.resetLink.name;
  const ResetLinkScreen({super.key});

  @override
  State<ResetLinkScreen> createState() => _ResetLinkScreenState();
}

class _ResetLinkScreenState extends State<ResetLinkScreen> {
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
              const ResetLinkHeader(),
              ResendEmailWidget(),
            ],
          ),
        ));
  }
}
