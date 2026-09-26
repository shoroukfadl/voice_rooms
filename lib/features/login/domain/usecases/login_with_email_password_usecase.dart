import 'package:voice_rooms/core/either.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/features/login/domain/repository/login_repository.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';

class LoginWithEmailPasswordUseCase {
  final LoginRepository repository;

  LoginWithEmailPasswordUseCase(this.repository);

  Future<Either<AppException, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.loginWithEmailPassword(
      email: email,
      password: password,
    );
  }
}
