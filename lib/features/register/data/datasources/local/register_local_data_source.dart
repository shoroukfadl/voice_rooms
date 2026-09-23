import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';
import 'package:voice_rooms/features/register/data/model/user_model.dart';

abstract class RegisterLocalDataSource {
  Future<Either<AppException, void>> cacheUser(UserModel user);
}
