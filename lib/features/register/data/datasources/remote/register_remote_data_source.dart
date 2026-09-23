import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';
import 'package:voice_rooms/features/register/data/model/user_model.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<AppException, UserModel>> register({
    required String email,
    required String password,
    required String name,
  });
}
