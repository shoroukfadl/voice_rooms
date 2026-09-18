import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/login/presentation/widget/dont_have_account.dart';
import 'package:voice_rooms/features/login/presentation/widget/forget_password_button.dart';
import 'package:voice_rooms/features/login/presentation/widget/login_button.dart';
import 'package:voice_rooms/features/login/presentation/widget/login_header.dart';
import 'package:voice_rooms/features/login/presentation/widget/sign_in%20_with_google.dart';
import 'package:voice_rooms/features/login/presentation/widget/sign_with_app.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.login.name;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email, password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
        body: Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: mobileHozPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoginHeader(),
          40.0.heightBox,
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: email,
                    label: Strings.emailLabel.translate,
                    keyboardType: TextInputType.emailAddress,
                    // validator:,
                  ),
                  40.0.heightBox,
                  CustomTextField(
                    controller: email,
                    label: Strings.passwordLabel.translate,
                    keyboardType: TextInputType.visiblePassword,
                    obscure: true,
                  ),
                ],
              )),
          8.0.heightBox,
          const Align(
            alignment: AlignmentDirectional.centerEnd,
            child: ForgetPasswordButton(),
          ),
          40.0.heightBox,
          LoginButton(onPress: () {}),
          const SizedBox(height: 40),
          const LoginWithGoogleButton(),
          const SizedBox(height: 24),
          const SignInWithApple(),
          const SizedBox(height: 24),
          const DontHaveAccount(),
          const SizedBox(height: 100),
        ],
      ),
    ));
  }
}
