import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/login/presentation/cubit/login_cubit.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_button_widget.dart';

class LoginWithGoogleButton extends StatelessWidget {
  final Function()? onPressed;
  const LoginWithGoogleButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state.loginStatus.isLoading;
        return CustomButtonWidget(
          title: Strings.signInWithGoogle.translate,
          titleColor: colors.text1,
          width: double.infinity,
          btnColor: colors.surface,
          borderColor: colors.border,
          onPressed: isLoading ? null : onPressed,
        );
      },
      listener: (context, state) {
        state.loginStatus.when(
          initial: () {},
          loading: () {},
          success: () {},
          failure: (message, error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
        );
      },
    );
  }
}
