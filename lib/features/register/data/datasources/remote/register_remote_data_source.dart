import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/register/data/model/user_model.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<AppException, UserModel>> register({
    required String email,
    required String password,
    required String name,
  });
}
