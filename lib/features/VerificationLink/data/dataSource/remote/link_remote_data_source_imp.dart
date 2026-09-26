import 'package:firebase_auth/firebase_auth.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';

import 'link_remote_data_source.dart';

class LinkRemoteDataSourceImpl implements LinkRemoteDataSource {
  final FirebaseAuth auth;
  const LinkRemoteDataSourceImpl(
    this.auth,
  );

  /// register
  @override
  Future<Either<AppException, void>> verifyEmail() async {
    try {
      await auth.currentUser?.sendEmailVerification();

      return Either.right(null);
    } catch (e) {
      return Either.left(FirebaseExceptionHelper.handle(e));
    }
  }
}
