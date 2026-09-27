import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/core/validators.dart';
import 'package:roomly/features/login/presentation/cubit/login_cubit.dart';
import 'package:roomly/features/login/presentation/widget/dont_have_account.dart';
import 'package:roomly/features/login/presentation/widget/forget_password_button.dart';
import 'package:roomly/features/login/presentation/widget/login_button.dart';
import 'package:roomly/features/login/presentation/widget/login_header.dart';
import 'package:roomly/features/login/presentation/widget/sign_in%20_with_google.dart';
import 'package:roomly/features/login/presentation/widget/sign_with_app.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/interactive_widgets/custom_text_field.dart';

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
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: mobileHozPadding, vertical: 0),
      child: ListView(
        children: [
          40.0.heightBox,
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
                    validator: Validators.validateEmail,
                  ),
                  40.0.heightBox,
                  CustomTextField(
                    controller: password,
                    label: Strings.passwordLabel.translate,
                    keyboardType: TextInputType.visiblePassword,
                    obscure: true,
                    validator: Validators.validatePassword,
                  ),
                ],
              )),
          const Align(
            alignment: AlignmentDirectional.centerEnd,
            child: ForgetPasswordButton(),
          ),
          24.0.heightBox,
          LoginButton(
            onPress: () async {
              if (_formKey.currentState!.validate()) {
                await context.read<LoginCubit>().loginWithEmailPassword(
                      email: email.text.trim(),
                      password: password.text.trim(),
                    );
              }
            },
          ),
          const SizedBox(height: 40),
          LoginWithGoogleButton(
            onPressed: () async {
              await context.read<LoginCubit>().loginWithGoogle();
            },
          ),
          const SizedBox(height: 24),
          const SignInWithApple(),
          const SizedBox(height: 24),
          const DontHaveAccount(),
        ],
      ),
    ));
  }
}
