import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/register/domain/entities/user_entity.dart';
import 'package:roomly/features/register/domain/repository/register_repo.dart';

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
