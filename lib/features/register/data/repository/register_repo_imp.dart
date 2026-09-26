import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';
import 'package:voice_rooms/features/register/data/datasources/local/register_local_data_source.dart';
import 'package:voice_rooms/features/register/data/datasources/remote/register_remote_data_source.dart';
import 'package:voice_rooms/features/register/domain/entities/user_entity.dart';
import 'package:voice_rooms/features/register/domain/repository/register_repo.dart';

class RegisterRepoImp implements RegisterRep {
  final RegisterRemoteDataSource remoteDataSource;
  final RegisterLocalDataSource localDataSource;
  const RegisterRepoImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  Future<Either<AppException, UserEntity>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final res = await remoteDataSource.register(
      email: email,
      password: password,
      name: name,
    );
    return res.fold((l) {
      return Either.left(l);
    }, (r) async {
      await localDataSource.cacheUser(r);
      return Either.right(r.toEntity());
    });
  }
}
