
import 'package:roomly/features/login/data/datasources/local/login_local_data_source.dart';
import 'package:roomly/features/login/data/datasources/remote/login_remote_data_source.dart';
import 'package:roomly/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  // @override
  // Future<Either<AppException, UserEntity>> loginWithEmailPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   final result = await remoteDataSource.loginWithEmailPassword(
  //     email: email,
  //     password: password,
  //   );
  //   if (result.isLeft()) {
  //     return Either.left(result.left!);
  //   }
  //   final userModel = result.right!;
  //   await localDataSource.cacheUser(userModel);
  //   return Either.right(userModel.toEntity());
  // }

  // @override
  // Future<Either<AppException, UserEntity>> loginWithGoogle() async {
  //   final result = await remoteDataSource.loginWithGoogle();
  //   if (result.isLeft()) {
  //     return Either.left(result.left!);
  //   }
  //   final userModel = result.right!;
  //   await localDataSource.cacheUser(userModel);
  //   return Either.right(userModel.toEntity());
  // }
  //
  // @override
  // Future<Either<AppException, void>> logout() async {
  //   final result = await remoteDataSource.logout();
  //   if (result.isLeft()) {
  //     return Either.left(result.left!);
  //   }
  //   await localDataSource.clearCachedUser();
  //   return Either.right(null);
  // }
  //
  // @override
  // Future<Either<AppException, UserEntity?>> getCurrentUser() async {
  //   final remoteResult = await remoteDataSource.getCurrentUser();
  //   if (remoteResult.isRight() && remoteResult.right != null) {
  //     final userModel = remoteResult.right!;
  //     await localDataSource.cacheUser(userModel);
  //     return Either.right(userModel.toEntity());
  //   }
  //
  //   if (remoteResult.isLeft()) {
  //     final localResult = await localDataSource.getCachedUser();
  //     if (localResult.isLeft()) {
  //       return Either.left(localResult.left!);
  //     }
  //     return Either.right(localResult.right?.toEntity());
  //   }
  //
  //   return Either.right(null);
  // }
  //
  // @override
  // Future<Either<AppException, void>> sendPasswordResetEmail({
  //   required String email,
  // }) async {
  //   return remoteDataSource.sendPasswordResetEmail(email: email);
  // }
  //
  // @override
  // Future<Either<AppException, void>> cacheUser(UserEntity user) async {
  //   final userModel = UserModel(
  //     uid: user.uid,
  //     email: user.email,
  //     name: user.name,
  //     createdAt: user.createdAt,
  //     avatarUrl: user.avatarUrl,
  //     authProvider: user.authProvider,
  //     bio: user.bio,
  //     emailVerified: user.emailVerified,
  //     fcmTokens: user.fcmTokens,
  //     username: user.username,
  //   );
  //   return localDataSource.cacheUser(userModel);
  // }
  //
  // @override
  // Future<Either<AppException, UserEntity?>> getCachedUser() async {
  //   final result = await localDataSource.getCachedUser();
  //   if (result.isLeft()) {
  //     return Either.left(result.left!);
  //   }
  //   return Either.right(result.right?.toEntity());
  // }
  //
  // @override
  // Future<Either<AppException, void>> clearCachedUser() async {
  //   return localDataSource.clearCachedUser();
  // }
}
