import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/sendCode/data/models/phone_code_result.dart';
import 'package:roomly/features/sendCode/domain/repository/send_code_repository.dart';
import 'package:roomly/utilities/request_status.dart';

class SendCodeUseCase {
  final SendCodeRepository repository;

  SendCodeUseCase({required this.repository});

  Future<Either<RequestFailure, PhoneCodeResult>> call(
      {required String phone}) async {
    return repository.sendCode(phone: phone);
  }
}
