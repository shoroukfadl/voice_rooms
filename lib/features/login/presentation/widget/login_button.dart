import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/home/presentation/pages/home_screen.dart';
import 'package:voice_rooms/features/login/presentation/cubit/login_cubit.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/helper_function.dart';
import 'package:voice_rooms/widgets/interactive_widgets/primary_button_widget.dart';

class LoginButton extends StatelessWidget {
  final Function() onPress;
  const LoginButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state.loginStatus.isLoading;
        return PrimaryButtonWidget(
          title: Strings.login.translate,
          onTap: isLoading ? () {} : onPress,
          loading: isLoading,
        );
      },
      listener: (context, state) {
        if (state.loginStatus.isFailure) {
          HelperFunctions.showCustomToast(
            context,
            type: ContentType.failure,
            message: state.loginStatus.message,
          );
        } else if (state.loginStatus.isSuccess) {
          if (state.user != null) {
            context.goNamed(HomeScreen.routeName);
          }
        }
      },
    );
  }
}
