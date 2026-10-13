import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/codeVerification/domain/repository/code_verif_repo.dart';
import 'package:roomly/utilities/request_status.dart';

class VerifyCodeUseCase {
  final VerifyCodeRepository repository;

  VerifyCodeUseCase({required this.repository});

  Future<Either<RequestFailure, void>> call({
    required String verificationId,
    required String smsCode,
  }) async {
    return await repository.verifyCode(
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }
}
