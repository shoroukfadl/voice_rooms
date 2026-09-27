import 'package:roomly/core/either.dart';
import 'package:roomly/core/error/failures.dart';
import 'package:roomly/features/login/domain/repository/login_repository.dart';

class LogoutUseCase {
  final LoginRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<AppException, void>> call() {
    return repository.logout();
  }
}
