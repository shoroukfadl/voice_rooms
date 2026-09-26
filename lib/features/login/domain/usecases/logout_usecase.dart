import 'package:voice_rooms/core/either.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/features/login/domain/repository/login_repository.dart';

class LogoutUseCase {
  final LoginRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<AppException, void>> call() {
    return repository.logout();
  }
}
