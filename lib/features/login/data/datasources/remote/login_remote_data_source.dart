import 'package:voice_rooms/core/either.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/features/register/data/model/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<AppException, UserModel>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<AppException, UserModel>> loginWithGoogle();

  Future<Either<AppException, void>> logout();

  Future<Either<AppException, UserModel?>> getCurrentUser();

  Future<Either<AppException, void>> sendPasswordResetEmail({
    required String email,
  });
}
