import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/localStorage/boxes.dart';
import 'package:voice_rooms/core/localStorage/hive_helper.dart';
import 'package:voice_rooms/core/localStorage/hive_manager.dart';
import 'package:voice_rooms/core/network/custom_either.dart';
import 'package:voice_rooms/features/register/data/model/user_model.dart';
import 'package:voice_rooms/utilities/git_it.dart';

import '../local/register_local_data_source.dart';

class RegisterLocalDataSourceImpl implements RegisterLocalDataSource {
  RegisterLocalDataSourceImpl();

  @override
  Future<Either<AppException, void>> cacheUser(UserModel user) async {
    final hive = HiveHelper<UserModel>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    try {
      await hive.put(key: user.uid, value: user);
      return Either.right(null);
    } catch (e) {
      return Either.left(HiveExceptionHelper.handle(e));
    }
  }
}
