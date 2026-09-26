import 'package:voice_rooms/core/either.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/features/login/domain/repository/login_repository.dart';

class SendPasswordResetEmailUseCase {
  final LoginRepository repository;

  SendPasswordResetEmailUseCase(this.repository);

  Future<Either<AppException, void>> call({
    required String email,
  }) {
    return repository.sendPasswordResetEmail(email: email);
  }
}
