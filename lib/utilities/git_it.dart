import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class GitIt {
  static Future initGitIt() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(
      () => sharedPrefs,
    );

    _initPortfolio();
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
