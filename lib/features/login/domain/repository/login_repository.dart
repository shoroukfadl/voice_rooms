import 'package:voice_rooms/core/either.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either<AppException, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<AppException, UserEntity>> loginWithGoogle();

  Future<Either<AppException, void>> logout();

  Future<Either<AppException, UserEntity?>> getCurrentUser();

  Future<Either<AppException, void>> sendPasswordResetEmail({
    required String email,
  });

  Future<Either<AppException, void>> cacheUser(UserEntity user);

  Future<Either<AppException, UserEntity?>> getCachedUser();

  Future<Either<AppException, void>> clearCachedUser();
}
