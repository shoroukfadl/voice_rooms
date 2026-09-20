import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/forgotPassword/presentation/widget/forgot_header.dart';
import 'package:voice_rooms/features/forgotPassword/presentation/widget/login_widget.dart';
import 'package:voice_rooms/features/forgotPassword/presentation/widget/reset_password.dart';
import 'package:voice_rooms/features/resetLink/presentation/pages/reset_link_screen.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.forgotPassword.name;
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController email;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: mobileHozPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ForgetPasswordHeader(),
          40.0.heightBox,
          Form(
            key: _formKey,
            child: CustomTextField(
              controller: email,
              label: Strings.emailLabel.translate,
              keyboardType: TextInputType.emailAddress,
              // validator:,
            ),
          ),
          40.0.heightBox,
          ResetLinkButton(onPress: () {
            context.goNamed(ResetLinkScreen.routeName);
          }),
          24.0.heightBox,
          const GoToLogin(),
          const SizedBox(height: 100),
        ],
      ),
    ));
  }
}
