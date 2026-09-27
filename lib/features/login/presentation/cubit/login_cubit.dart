import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_rooms/features/login/domain/usecases/get_current_user_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/login_with_email_password_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/login_with_google_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/logout_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';
import 'package:voice_rooms/utilities/request_status.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginWithEmailPasswordUseCase loginWithEmailPasswordUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;
  final Connectivity _connectivity;

  final List<StreamSubscription> _subscriptions = [];

  LoginCubit({
    required this.loginWithEmailPasswordUseCase,
    required this.loginWithGoogleUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
    required this.sendPasswordResetEmailUseCase,
    Connectivity? connectivity,
  })  : _connectivity = connectivity ?? Connectivity(),
        super(const LoginState());

  Future<bool> _checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Future<void> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final hasConnection = await _checkConnectivity();
    if (!hasConnection) {
      emit(state.copyWithMethod(
        loginStatus: RequestFailure('No internet connection. Please check your network.'),
      ));
      return;
    }

    emit(state.copyWithMethod(loginStatus: const RequestLoading()));
    
    final result = await loginWithEmailPasswordUseCase(
      email: email,
      password: password,
    );
    
    if (!isClosed) {
      result.fold(
        (failure) => emit(state.copyWithMethod(
          loginStatus: RequestFailure(failure.message),
        )),
        (user) => emit(state.copyWithMethod(
          loginStatus: const RequestSuccess(),
          user: user,
        )),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    final hasConnection = await _checkConnectivity();
    if (!hasConnection) {
      emit(state.copyWithMethod(
        googleLoginStatus: RequestFailure('No internet connection. Please check your network.'),
      ));
      return;
    }

    emit(state.copyWithMethod(googleLoginStatus: const RequestLoading()));
    
    final result = await loginWithGoogleUseCase();
    
    if (!isClosed) {
      result.fold(
        (failure) => emit(state.copyWithMethod(
          googleLoginStatus: RequestFailure(failure.message),
        )),
        (user) => emit(state.copyWithMethod(
          googleLoginStatus: const RequestSuccess(),
          user: user,
        )),
      );
    }
  }

  Future<void> logout() async {
    emit(state.copyWithMethod(logoutStatus: const RequestLoading()));
    final result = await logoutUseCase();
    result.fold(
      (failure) => emit(state.copyWithMethod(
        logoutStatus: RequestFailure(failure.message),
      )),
      (_) => emit(state.copyWithMethod(
        logoutStatus: const RequestSuccess(),
        user: null,
      )),
    );
  }

  Future<void> getCurrentUser() async {
    emit(state.copyWithMethod(loginStatus: const RequestLoading()));
    final result = await getCurrentUserUseCase();
    result.fold(
      (failure) => emit(state.copyWithMethod(
        loginStatus: RequestFailure(failure.message),
      )),
      (user) {
        if (user != null) {
          emit(state.copyWithMethod(
            loginStatus: const RequestSuccess(),
            user: user,
          ));
        } else {
          emit(state.copyWithMethod(
            loginStatus: const RequestInitial(),
            user: null,
          ));
        }
      },
    );
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    final hasConnection = await _checkConnectivity();
    if (!hasConnection) {
      emit(state.copyWithMethod(
        passwordResetStatus: RequestFailure('No internet connection. Please check your network.'),
      ));
      return;
    }

    emit(state.copyWithMethod(passwordResetStatus: const RequestLoading()));
    
    final result = await sendPasswordResetEmailUseCase(email: email);
    
    if (!isClosed) {
      result.fold(
        (failure) => emit(state.copyWithMethod(
          passwordResetStatus: RequestFailure(failure.message),
        )),
        (_) => emit(state.copyWithMethod(
          passwordResetStatus:
              const RequestSuccess('Password reset email sent successfully'),
        )),
      );
    }
  }

  void resetState() {
    emit(const LoginState());
  }

  @override
  Future<void> close() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
    return super.close();
  }
}
