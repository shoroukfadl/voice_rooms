import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/core/validators.dart';
import 'package:voice_rooms/features/home/presentation/pages/home_screen.dart';
import 'package:voice_rooms/features/login/presentation/cubit/login_cubit.dart';
import 'package:voice_rooms/features/login/presentation/cubit/login_state.dart';
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

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginWithEmailPassword(
            email: email.text.trim(),
            password: password.text.trim(),
          );
    }
  }

  void _handleGoogleLogin() {
    context.read<LoginCubit>().loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: mobileHozPadding, vertical: 40),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.goNamed(HomeScreen.routeName);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is PasswordResetSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is PasswordResetFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final isLoading = state is LoginLoading ||
                state is LogoutLoading ||
                state is PasswordResetLoading;

            return ListView(
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
                  onPress: isLoading ? () {} : _handleLogin,
                  isLoading: isLoading,
                ),
                const SizedBox(height: 40),
                LoginWithGoogleButton(
                  onPressed: isLoading ? () {} : _handleGoogleLogin,
                ),
                const SizedBox(height: 24),
                const SignInWithApple(),
                const SizedBox(height: 24),
                const DontHaveAccount(),
                const SizedBox(height: 100),
              ],
            );
          },
        ),
      ),
    ));
  }
}
