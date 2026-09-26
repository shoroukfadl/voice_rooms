import 'package:voice_rooms/core/either.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/features/login/domain/repository/login_repository.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';

class GetCurrentUserUseCase {
  final LoginRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Either<AppException, UserEntity?>> call() {
    return repository.getCurrentUser();
  }
}
