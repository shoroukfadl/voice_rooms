import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/codeVerification/data/dataSource/remote/code_verif_remote_data_source.dart';
import 'package:roomly/features/codeVerification/domain/repository/code_verif_repo.dart';
import 'package:roomly/utilities/request_status.dart';

class VerifyCodeRepositoryImpl implements VerifyCodeRepository {
  final VerifyCodeRemoteDataSource remoteDataSource;

  VerifyCodeRepositoryImpl({
    required this.remoteDataSource,
  });
  Future<Either<RequestFailure, void>> verifyCode({
    required String verificationId,
    required String smsCode,
  }) async {
    return remoteDataSource.verifyCode(
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }
}
