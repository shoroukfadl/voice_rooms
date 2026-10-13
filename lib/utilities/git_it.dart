import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:roomly/core/language/locale_cubit.dart';
import 'package:roomly/core/localStorage/hive_manager.dart';
import 'package:roomly/features/VerificationLink/data/dataSource/remote/link_remote_data_source.dart';
import 'package:roomly/features/VerificationLink/data/dataSource/remote/link_remote_data_source_imp.dart';
import 'package:roomly/features/VerificationLink/data/repository/link_repo_imp.dart';
import 'package:roomly/features/VerificationLink/domain/repository/link_repo.dart';
import 'package:roomly/features/VerificationLink/domain/useCases/link_useCase.dart';
import 'package:roomly/features/VerificationLink/presentation/cubit/link_cubit.dart';
import 'package:roomly/features/codeVerification/data/dataSource/remote/code_verif_remote_data_source.dart';
import 'package:roomly/features/codeVerification/data/dataSource/remote/code_verif_remote_data_source_impl.dart';
import 'package:roomly/features/codeVerification/data/repository/code_verif_repo_imp.dart';
import 'package:roomly/features/codeVerification/domain/repository/code_verif_repo.dart';
import 'package:roomly/features/codeVerification/domain/usecase/verify_code_usecase.dart';
import 'package:roomly/features/codeVerification/presentation/cubit/code_verification_cubit.dart';
import 'package:roomly/features/sendCode/data/datasources/remote/send_remote_data_source.dart';
import 'package:roomly/features/sendCode/data/datasources/remote/send_remote_data_source_impl.dart';
import 'package:roomly/features/sendCode/data/repository/send_code_repository_impl.dart';
import 'package:roomly/features/sendCode/domain/repository/send_code_repository.dart';
import 'package:roomly/features/sendCode/domain/usecases/send_code_usecase.dart';
// import 'package:roomly/features/sendCode/domain/usecases/get_current_user_usecase.dart';
// import 'package:roomly/features/sendCode/domain/usecases/login_with_email_password_usecase.dart';
// import 'package:roomly/features/sendCode/domain/usecases/login_with_google_usecase.dart';
// import 'package:roomly/features/sendCode/domain/usecases/logout_usecase.dart';
// import 'package:roomly/features/sendCode/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:roomly/features/sendCode/presentation/cubit/send_code_cubit.dart';

final sl = GetIt.instance;

class GitIt {
  static Future initGitIt() async {
    await Hive.initFlutter();
    final settingsBox = await Hive.openBox('settings');
    sl.registerSingleton<LocaleCubit>(LocaleCubit(settingsBox));

    final firebaseStore = FirebaseFirestore.instance;
    sl.registerLazySingleton<FirebaseFirestore>(() => firebaseStore);

    final firebaseAuth = FirebaseAuth.instance;
    sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);

    final googleSignIn = GoogleSignIn();
    sl.registerLazySingleton<GoogleSignIn>(() => googleSignIn);

    final connectivity = Connectivity();
    sl.registerLazySingleton<Connectivity>(() => connectivity);

    _initGitIt();

    _initLink();
    _initSendCode();
    _initVerifyCode();
  }

  static Future<void> _initGitIt() async {
    sl.registerLazySingleton<HiveManager>(
      () => HiveManager.instance,
    );

    final hiveManager = GetIt.I<HiveManager>();

    await hiveManager.init();
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

  static void _initSendCode() {
    sl.registerFactory(() => SendCodeCubit(
          sendCodeUseCase: sl(),
        ));
    sl.registerLazySingleton(() => SendCodeUseCase(repository: sl()));
    sl.registerLazySingleton<SendCodeRepository>(
      () => SendCodeRepositoryImpl(
        remoteDataSource: sl(),
      ),
    );

    //! Data Sources
    sl.registerLazySingleton<SendCodeRemoteDataSource>(
      () => SendCodeRemoteDataSourceImpl(
        sl(),
      ),
    );
  }

  static void _initVerifyCode() {
    sl.registerFactory(() => VerifyCodeCubit(
          sendCodeUseCase: sl(),
        ));
    sl.registerLazySingleton(() => VerifyCodeUseCase(repository: sl()));
    sl.registerLazySingleton<VerifyCodeRepository>(
      () => VerifyCodeRepositoryImpl(
        remoteDataSource: sl(),
      ),
    );

    //! Data Sources
    sl.registerLazySingleton<VerifyCodeRemoteDataSource>(
      () => VerifyCodeRemoteDataSourceImpl(
        sl(),
        sl(),
      ),
    );
  }
}
