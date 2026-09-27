import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/register/data/model/user_model.dart';

abstract class RegisterLocalDataSource {
  Future<Either<AppException, void>> cacheUser(UserModel user);
}
