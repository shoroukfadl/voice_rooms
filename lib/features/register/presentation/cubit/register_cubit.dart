import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_rooms/features/register/domain/usecase/register_usecase.dart';
import 'package:voice_rooms/utilities/request_status.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(const RegisterState());

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(state.copyWithMethod(requestStatus: const RequestLoading()));
    final result = await registerUseCase.call(
        email: email, password: password, name: name);
    result.fold(
      (l) => emit(state.copyWithMethod(
          requestStatus: RequestFailure(l.message, l.originalError))),
      (r) => emit(state.copyWithMethod(requestStatus: const RequestSuccess())),
    );
  }
}
