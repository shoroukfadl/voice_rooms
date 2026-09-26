import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';

abstract class RegisterRep {
  Future<Either<AppException, UserEntity>> register({
    required String email,
    required String password,
    required String name,
  });
}
