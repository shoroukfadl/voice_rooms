import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/sendCode/data/datasources/remote/send_remote_data_source.dart';
import 'package:roomly/features/sendCode/data/models/phone_code_result.dart';
import 'package:roomly/features/sendCode/domain/repository/send_code_repository.dart';
import 'package:roomly/utilities/request_status.dart';

class SendCodeRepositoryImpl implements SendCodeRepository {
  final SendCodeRemoteDataSource remoteDataSource;

  SendCodeRepositoryImpl({
    required this.remoteDataSource,
  });
  Future<Either<RequestFailure, PhoneCodeResult>> sendCode(
      {required String phone}) async {
    return remoteDataSource.sendCode(phone: phone);
  }
}
