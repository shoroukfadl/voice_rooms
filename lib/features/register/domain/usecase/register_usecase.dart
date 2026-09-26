import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';
import 'package:voice_rooms/features/register/domain/repository/register_repo.dart';

class RegisterUseCase {
  final RegisterRep registerRep;
  RegisterUseCase(this.registerRep);
  Future<Either<AppException, UserEntity>> call({
    required String email,
    required String password,
    required String name,
  }) async =>
      await registerRep.register(email: email, password: password, name: name);
}
