import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roomly/core/either.dart';
import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/network.dart';
import 'package:roomly/features/login/data/datasources/remote/login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final ConnectivityService connectivityService;

  LoginRemoteDataSourceImpl(
    this.firebaseAuth,
    this.googleSignIn, {
    ConnectivityService? connectivityService,
  }) : connectivityService =
            connectivityService ?? ConnectivityService.instance;

  Future<Either<AppException, void>> _ensureConnected() async {
    final isOnline = await connectivityService.checkConnection();
    if (!isOnline) {
      return Either.left(AppException(
        message: 'No internet connection',
        code: 'no-internet',
        source: ErrorSource.network,
      ));
    }
    return Either.right(null);
  }

  // @override
  // Future<Either<AppException, UserModel>> loginWithEmailPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await _ensureConnected();
  //
  //     final credential = await firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //
  //     return Either.right(UserModel.fromFirestore(credential));
  //   } catch (e) {
  //     if (e is AppException) return Either.left(e);
  //     return Either.left(FirebaseExceptionHelper.handle(e));
  //   }
  // }
}
