import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomly/features/sendCode/data/models/phone_code_result.dart';
import 'package:roomly/features/sendCode/domain/usecases/send_code_usecase.dart';
import 'package:roomly/utilities/request_status.dart';

part 'send_code_state.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  final SendCodeUseCase sendCodeUseCase;

  SendCodeCubit({required this.sendCodeUseCase}) : super(const SendCodeState());

  Future<void> sendCode({required String phone, int? resendToken}) async {
    emit(state.copyWithMethod(sendCodeStatus: const RequestLoading()));

    final result = await sendCodeUseCase.call(
      phone: phone,
      //  resendToken: resendToken,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWithMethod(
        sendCodeStatus: RequestFailure(failure.message),
      )),
      (re) => emit(state.copyWithMethod(
        sendCodeStatus: const RequestSuccess(),
        result: re,
      )),
    );
  }

  void resetState() => emit(const SendCodeState());
}
