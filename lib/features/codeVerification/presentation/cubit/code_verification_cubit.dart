import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomly/features/codeVerification/domain/usecase/verify_code_usecase.dart';
import 'package:roomly/features/codeVerification/presentation/cubit/code_verification_state.dart';
import 'package:roomly/utilities/request_status.dart';

class VerifyCodeCubit extends Cubit<CodeVerificationState> {
  final VerifyCodeUseCase sendCodeUseCase;

  VerifyCodeCubit({required this.sendCodeUseCase})
      : super(const CodeVerificationState());

  Future<void> verifyCode(
      {required String smsCode, required String verificationId}) async {
    emit(state.copyWithMethod(sendCodeStatus: const RequestLoading()));

    final result = await sendCodeUseCase.call(
      smsCode: smsCode,
      verificationId: verificationId,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWithMethod(
        sendCodeStatus: RequestFailure(failure.message),
      )),
      (re) => emit(state.copyWithMethod(
        sendCodeStatus: const RequestSuccess(),
      )),
    );
  }

  void resetState() => emit(const CodeVerificationState());
}
