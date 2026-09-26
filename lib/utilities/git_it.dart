import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:voice_rooms/core/localStorage/hive_manager.dart';
import 'package:voice_rooms/features/VerificationLink/data/dataSource/remote/link_remote_data_source.dart';
import 'package:voice_rooms/features/VerificationLink/data/dataSource/remote/link_remote_data_source_imp.dart';
import 'package:voice_rooms/features/VerificationLink/data/repository/link_repo_imp.dart';
import 'package:voice_rooms/features/VerificationLink/domain/repository/link_repo.dart';
import 'package:voice_rooms/features/VerificationLink/domain/useCases/link_useCase.dart';
import 'package:voice_rooms/features/VerificationLink/presentation/cubit/link_cubit.dart';
import 'package:voice_rooms/features/login/data/datasources/local/login_local_data_source.dart';
import 'package:voice_rooms/features/login/data/datasources/local/login_local_data_source_impl.dart';
import 'package:voice_rooms/features/login/data/datasources/remote/login_remote_data_source.dart';
import 'package:voice_rooms/features/login/data/datasources/remote/login_remote_data_source_impl.dart';
import 'package:voice_rooms/features/login/data/repository/login_repository_impl.dart';
import 'package:voice_rooms/features/login/domain/repository/login_repository.dart';
import 'package:voice_rooms/features/login/domain/usecases/get_current_user_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/login_with_email_password_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/login_with_google_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/logout_usecase.dart';
import 'package:voice_rooms/features/login/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:voice_rooms/features/login/presentation/cubit/login_cubit.dart';
import 'package:voice_rooms/features/register/data/datasources/local/register_local_data_source.dart';
import 'package:voice_rooms/features/register/data/datasources/local/register_local_data_source_imp.dart';
import 'package:voice_rooms/features/register/data/datasources/remote/register_remote_data_source.dart';
import 'package:voice_rooms/features/register/data/datasources/remote/register_remote_data_source_imp.dart';
import 'package:voice_rooms/features/register/data/repository/register_repo_imp.dart';
import 'package:voice_rooms/features/register/domain/repository/register_repo.dart';
import 'package:voice_rooms/features/register/domain/usecase/register_usecase.dart';
import 'package:voice_rooms/features/register/presentation/cubit/register_cubit.dart';

final sl = GetIt.instance;

class GitIt {
  static Future initGitIt() async {
    final firebaseStore = FirebaseFirestore.instance;
    sl.registerLazySingleton<FirebaseFirestore>(() => firebaseStore);

    final firebaseAuth = FirebaseAuth.instance;
    sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);

    final googleSignIn = GoogleSignIn();
    sl.registerLazySingleton<GoogleSignIn>(() => googleSignIn);

    _initGitIt();

    _initRegister();
    _initLink();
    _initLogin();
  }

  static Future<void> _initGitIt() async {
    sl.registerLazySingleton<HiveManager>(
      () => HiveManager.instance,
    );

    final hiveManager = GetIt.I<HiveManager>();

    await hiveManager.init();
  }

  static void _initRegister() {
    sl.registerFactory(() => RegisterCubit(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<RegisterRep>(
      () => RegisterRepoImp(localDataSource: sl(), remoteDataSource: sl()),
    );

    //! Data Sources
    sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(sl(), sl()),
    );
    sl.registerLazySingleton<RegisterLocalDataSource>(
      () => RegisterLocalDataSourceImpl(),
    );
  }

  static void _initLink() {
    sl.registerFactory(() => LinkCubit(sl()));
    sl.registerLazySingleton(() => LinkUseCase(sl()));
    sl.registerLazySingleton<LinkRep>(
      () => LinkRepoImp(remoteDataSource: sl()),
    );

    //! Data Sources
    sl.registerLazySingleton<LinkRemoteDataSource>(
      () => LinkRemoteDataSourceImpl(
        sl(),
      ),
    );
  }

  static void _initLogin() {
    sl.registerFactory(() => LoginCubit(
          loginWithEmailPasswordUseCase: sl(),
          loginWithGoogleUseCase: sl(),
          logoutUseCase: sl(),
          getCurrentUserUseCase: sl(),
          sendPasswordResetEmailUseCase: sl(),
        ));
    sl.registerLazySingleton(() => LoginWithEmailPasswordUseCase(sl()));
    sl.registerLazySingleton(() => LoginWithGoogleUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));
    sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
    sl.registerLazySingleton(() => SendPasswordResetEmailUseCase(sl()));
    sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
      ),
    );

    //! Data Sources
    sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(sl(), sl()),
    );
    sl.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(),
    );
  }
}
