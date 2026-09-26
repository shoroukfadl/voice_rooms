import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/features/login/domain/usecases/get_current_user_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/login_with_email_password_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/login_with_google_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/logout_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:voice_rooms/features/login/presentation/cubit/login_state.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginWithEmailPasswordUseCase loginWithEmailPasswordUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;

  LoginCubit({
    required this.loginWithEmailPasswordUseCase,
    required this.loginWithGoogleUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
    required this.sendPasswordResetEmailUseCase,
  }) : super(LoginInitial());

   Future<void> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await loginWithEmailPasswordUseCase(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await loginWithGoogleUseCase();
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }


  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await logoutUseCase();
    result.fold(
      (failure) => emit(LogoutFailure(failure.message)),
      (_) => emit(LogoutSuccess()),
    );
  }

  Future<void> getCurrentUser() async {
    emit(LoginLoading());
    final result = await getCurrentUserUseCase();
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) {
        if (user != null) {
          emit(LoginSuccess(user));
        } else {
          emit(LoginInitial());
        }
      },
    );
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(PasswordResetLoading());
    final result = await sendPasswordResetEmailUseCase(email: email);
    result.fold(
      (failure) => emit(PasswordResetFailure(failure.message)),
      (_) => emit(
        const PasswordResetSuccess(
          'Password reset email sent successfully',
        ),
      ),
    );
  }

  void resetState() {
    emit(LoginInitial());
  }
}
