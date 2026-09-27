import 'package:roomly/core/either.dart';
import 'package:roomly/core/error/failures.dart';
import 'package:roomly/features/register/data/model/user_model.dart';

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
