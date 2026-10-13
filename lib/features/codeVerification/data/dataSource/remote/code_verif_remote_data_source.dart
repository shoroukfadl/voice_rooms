import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/utilities/request_status.dart';

abstract class VerifyCodeRemoteDataSource {
  Future<Either<RequestFailure, void>> verifyCode({
    required String verificationId,
    required String smsCode,
  });
}
