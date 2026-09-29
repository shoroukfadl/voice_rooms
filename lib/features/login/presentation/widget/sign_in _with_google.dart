import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/login/presentation/cubit/login_cubit.dart';
import 'package:roomly/utilities/helper_function.dart';
import 'package:roomly/widgets/interactive_widgets/custom_button_widget.dart';

class LoginWithGoogleButton extends StatelessWidget {
  final Function()? onPressed;
  const LoginWithGoogleButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state.googleLoginStatus.isLoading;
        return CustomButtonWidget(
          title: "Strings.signInWithGoogle.translate",
          titleColor: colors.text1,
          width: double.infinity,
          btnColor: colors.surface,
          borderColor: colors.border,
          onPressed: isLoading ? null : onPressed,
        );
      },
      listener: (context, state) {
        if (state.googleLoginStatus.isFailure) {
          HelperFunctions.showCustomToast(
            context,
            type: ContentType.failure,
            message: state.googleLoginStatus.message,
          );
        } else if (state.googleLoginStatus.isSuccess) {
          // if (state.user != null) {
          //   context.goNamed(HomeScreen.routeName);
          // }
        }
      },
    );
  }
}
