import 'package:roomly/core/either.dart';
import 'package:roomly/core/error/failures.dart';
import 'package:roomly/features/register/data/model/user_model.dart';

abstract class LoginLocalDataSource {
  Future<Either<AppException, void>> cacheUser(UserModel user);

  Future<Either<AppException, UserModel?>> getCachedUser();

  Future<Either<AppException, void>> clearCachedUser();

  Future<Either<AppException, void>> saveAuthToken(String token);

  Future<Either<AppException, String?>> getAuthToken();

  Future<Either<AppException, void>> clearAuthToken();
}
