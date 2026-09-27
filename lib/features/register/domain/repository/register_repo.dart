import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/register/domain/entities/user_entity.dart';

abstract class RegisterRep {
  Future<Either<AppException, UserEntity>> register({
    required String email,
    required String password,
    required String name,
  });
}
