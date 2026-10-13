import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/sendCode/data/models/phone_code_result.dart';
import 'package:roomly/utilities/request_status.dart';

abstract class SendCodeRemoteDataSource {
  Future<Either<RequestFailure, PhoneCodeResult>> sendCode({
    required String phone,
    int? resendToken,
  });
}
