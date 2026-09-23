import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voice_rooms/core/localStorage/hive_manager.dart';

final sl = GetIt.instance;

class GitIt {
  static Future initGitIt() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    final firebaseStore = FirebaseFirestore.instance;
    sl.registerLazySingleton<FirebaseFirestore>(() => firebaseStore);

    final firebaseAuth = FirebaseAuth.instance;
    sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);

    _initGitIt();

    _initPortfolio();
  }

  static Future<void> _initGitIt() async {
    sl.registerLazySingleton<HiveManager>(
      () => HiveManager.instance,
    );

    final hiveManager = GetIt.I<HiveManager>();

    await hiveManager.init();
  }

  static void _initPortfolio() {
    //sl.registerFactory(() => PortfolioCubit(getDataUseCase: sl()));
    // sl.registerLazySingleton(() => GetDataUseCase(sl()));
    // sl.registerLazySingleton<Repo>(
    //   () => RepoImp(
    //     sl(),
    //   ),
    // );
    //
    // //! Data Sources
    // sl.registerLazySingleton<RemoteDataSource>(
    //   () => RemoteDataSourceImp(),
    // );
  }
}
