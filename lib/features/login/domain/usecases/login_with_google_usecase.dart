import 'package:roomly/core/either.dart';
import 'package:roomly/core/error/failures.dart';
import 'package:roomly/features/login/domain/repository/login_repository.dart';
import 'package:roomly/features/register/domain/entities/user_entity.dart';

class LoginWithGoogleUseCase {
  final LoginRepository repository;

  LoginWithGoogleUseCase(this.repository);

  Future<Either<AppException, UserEntity>> call() {
    return repository.loginWithGoogle();
  }
}
