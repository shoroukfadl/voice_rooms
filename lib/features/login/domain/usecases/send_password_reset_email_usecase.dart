import 'package:roomly/core/either.dart';
import 'package:roomly/core/error/failures.dart';
import 'package:roomly/features/login/domain/repository/login_repository.dart';

class SendPasswordResetEmailUseCase {
  final LoginRepository repository;

  SendPasswordResetEmailUseCase(this.repository);

  Future<Either<AppException, void>> call({
    required String email,
  }) {
    return repository.sendPasswordResetEmail(email: email);
  }
}
